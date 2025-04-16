#!/usr/bin/env python3
"""
Script para exportar una plantilla Astro a GrapesJS

Este script prepara una plantilla Astro existente para ser utilizada
con GrapesJS en el sistema DOMI.
"""

import os
import json
import shutil
import argparse
import zipfile
from pathlib import Path
import re

def extract_props_from_astro(content):
    """Extrae las propiedades de un componente Astro."""
    props = {}
    
    # Encuentra la sección de frontmatter (entre ---)
    frontmatter_match = re.search(r'---\s+(.*?)\s+---', content, re.DOTALL)
    
    if frontmatter_match:
        frontmatter = frontmatter_match.group(1)
        
        # Buscar declaraciones de props como: const { prop1, prop2 } = Astro.props;
        props_match = re.search(r'const\s*{\s*(.*?)\s*}\s*=\s*Astro\.props', frontmatter, re.DOTALL)
        
        if props_match:
            props_str = props_match.group(1)
            # Dividir por comas y procesar cada prop
            for prop in props_str.split(','):
                prop = prop.strip()
                if '=' in prop:
                    # Tiene un valor por defecto
                    name, default = prop.split('=', 1)
                    name = name.strip()
                    default = default.strip()
                    props[name] = {
                        "type": "string",
                        "required": False,
                        "default": default.strip("' \"")
                    }
                else:
                    props[prop] = {
                        "type": "string",
                        "required": True
                    }
    
    # También busca interfaces para tipos más complejos
    interface_match = re.search(r'interface\s+Props\s*{(.*?)}', content, re.DOTALL)
    if interface_match:
        interface_body = interface_match.group(1)
        # Procesar cada línea de la interfaz
        for line in interface_body.split('\n'):
            line = line.strip()
            if ':' in line and ';' in line:
                prop_def = line.split(':')[0].strip()
                prop_type = line.split(':')[1].split(';')[0].strip()
                
                # Determinar si es requerido basado en la ausencia de '?'
                required = '?' not in prop_def
                prop_name = prop_def.replace('?', '').strip()
                
                props[prop_name] = {
                    "type": "string" if "string" in prop_type else "object" if "object" in prop_type or "{" in prop_type else "array" if "[]" in prop_type else "number" if "number" in prop_type else "boolean" if "boolean" in prop_type else "string",
                    "required": required
                }
    
    return props

def process_component(component_path, output_dir, template_id):
    """Procesa un componente Astro y genera su metadata."""
    path = Path(component_path)
    
    # Leer el contenido del componente
    with open(path, 'r') as f:
        content = f.read()
    
    # Analizar el componente para extraer sus props
    props = extract_props_from_astro(content)
    
    # Preparar el nombre del componente
    name = path.stem
    relative_path = str(path).replace(os.getcwd(), "").replace("\\", "/")
    if relative_path.startswith('/'):
        relative_path = relative_path[1:]
    
    # Determinar categoría basada en nombre o contenido
    category = "UI"
    if name.lower() in ["nav", "header", "footer", "layout"]:
        category = "Layout"
    elif "head" in name.lower() or "meta" in name.lower():
        category = "SEO"
    elif "form" in name.lower() or "input" in name.lower():
        category = "Forms"
    
    # Crear objeto de componente para la configuración
    component_config = {
        "name": name,
        "path": relative_path,
        "props": props
    }
    
    # Generar SQL para insertar componente
    sql = f"""
INSERT INTO astro_components (template_id, name, path, content, props, category)
VALUES
({template_id}, '{name}', '{relative_path}', 
'{content.replace("'", "''")}',
'{json.dumps(props).replace("'", "''")}',
'{category}');
"""
    
    # Guardar SQL
    with open(os.path.join(output_dir, f"{name.lower()}_component.sql"), 'w') as f:
        f.write(sql)
    
    return component_config

def create_grapesjs_config(project_dir, output_dir):
    """Crea el archivo de configuración para GrapesJS."""
    components_dir = os.path.join(project_dir, "src/components")
    pages_dir = os.path.join(project_dir, "src/pages")
    layouts_dir = os.path.join(project_dir, "src/layouts")
    
    # Identificar componentes
    components = []
    if os.path.exists(components_dir):
        for file in os.listdir(components_dir):
            if file.endswith(".astro"):
                component_path = os.path.join(components_dir, file)
                component_config = process_component(component_path, output_dir, "${template_id}")
                components.append(component_config)
    
    # Identificar páginas
    pages = []
    if os.path.exists(pages_dir):
        for file in os.listdir(pages_dir):
            if file.endswith(".astro") and not file.startswith("_"):
                page_name = file.replace(".astro", "")
                page_path = f"src/pages/{file}"
                
                # Intentar detectar el layout utilizado
                layout_path = None
                with open(os.path.join(pages_dir, file), 'r') as f:
                    content = f.read()
                    layout_match = re.search(r'layout\s*=\s*[\'"](.+?)[\'"]', content)
                    if layout_match:
                        layout_path = f"src/layouts/{layout_match.group(1)}.astro"
                
                pages.append({
                    "name": page_name.capitalize(),
                    "path": page_path,
                    "layout": layout_path
                })
    
    # Crear regiones editables
    editable_regions = [
        {
            "name": "hero",
            "selector": "header.hero"
        },
        {
            "name": "main_content",
            "selector": "main.wrapper"
        },
        {
            "name": "header",
            "selector": "nav"
        },
        {
            "name": "footer",
            "selector": "footer"
        }
    ]
    
    # Crear configuración completa
    config = {
        "editable_regions": editable_regions,
        "components": components,
        "assets": {
            "baseUrl": "/assets/"
        },
        "styles": {
            "global": "/src/styles/global.css"
        },
        "pages": pages
    }
    
    # Guardar configuración
    config_path = os.path.join(output_dir, "grapesjs.config.json")
    with open(config_path, 'w') as f:
        json.dump(config, f, indent=2)
    
    return config

def create_template_zip(project_dir, output_dir):
    """Crea un archivo ZIP de la plantilla."""
    zip_path = os.path.join(output_dir, "template.zip")
    
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(project_dir):
            # Excluir directorios que no son necesarios
            if ".git" in dirs:
                dirs.remove(".git")
            if "node_modules" in dirs:
                dirs.remove("node_modules")
            
            for file in files:
                # Excluir archivos que no son necesarios
                if file.endswith(".zip") or file.endswith(".sql") or file == "grapesjs.config.json":
                    continue
                
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, project_dir)
                zipf.write(file_path, arcname)
    
    return zip_path

def main():
    parser = argparse.ArgumentParser(description='Exporta una plantilla Astro a GrapesJS.')
    parser.add_argument('--project', default='.', help='Ruta del proyecto Astro')
    parser.add_argument('--output', default='./output', help='Directorio de salida')
    args = parser.parse_args()
    
    project_dir = os.path.abspath(args.project)
    output_dir = os.path.abspath(args.output)
    
    # Crear directorio de salida si no existe
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    print(f"Procesando proyecto en: {project_dir}")
    print(f"Guardando resultados en: {output_dir}")
    
    # Crear configuración GrapesJS
    config = create_grapesjs_config(project_dir, output_dir)
    print(f"Configuración GrapesJS creada con {len(config['components'])} componentes")
    
    # Crear ZIP de la plantilla
    zip_path = create_template_zip(project_dir, output_dir)
    print(f"Plantilla empaquetada en: {zip_path}")
    
    # Generar instrucciones para el usuario
    instructions = """
    === Instrucciones de Uso ===
    
    1. Sube el archivo template.zip a tu sistema DOMI
    2. Usa el archivo grapesjs.config.json para la configuración del editor
    3. Ejecuta los scripts SQL para cargar los componentes en la base de datos
    
    Comando cURL para subir la plantilla:
    
    curl -X POST "https://tu-api.com/templates/" \\
      -H "Authorization: Bearer TU_TOKEN" \\
      -F "name=Astro Portfolio" \\
      -F "description=A modern portfolio template built with Astro" \\
      -F "template_zip=@{}" \\
      -F "grapesjs_config=@{}"
    """.format(
        os.path.join(output_dir, "template.zip"),
        os.path.join(output_dir, "grapesjs.config.json")
    )
    
    with open(os.path.join(output_dir, "README.txt"), 'w') as f:
        f.write(instructions)
    
    print("Exportación completada. Consulta README.txt para instrucciones.")

if __name__ == "__main__":
    main()