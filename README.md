# Astro Portfolio Template para GrapesJS

Esta plantilla Astro ha sido adaptada para su integración con GrapesJS en el sistema DOMI.

## Archivos Generados

1. `grapesjs.config.json` - Configuración para el editor GrapesJS
2. `domi_template_insert.sql` - Script SQL para insertar la plantilla en la base de datos
3. `export_to_grapesjs.py` - Script para automatizar la exportación de cualquier plantilla Astro a GrapesJS

## Instrucciones de Uso

### 1. Importar la plantilla a la base de datos

Ejecuta el script SQL `domi_template_insert.sql` en tu base de datos:

```bash
psql -U tu_usuario -d tu_base_de_datos -f domi_template_insert.sql
```

### 2. Configurar el editor GrapesJS

El archivo `grapesjs.config.json` contiene la configuración para el editor GrapesJS. Debes cargar esta configuración en tu frontend cuando inicialices el editor.

```javascript
// Ejemplo de carga de configuración en el frontend
const editorConfig = await fetch('/api/templates/1/grapesjs-config').then(res => res.json());

const editor = grapesjs.init({
  container: '#gjs',
  height: '100%',
  plugins: ['grapesjs-astro-components'],
  // Incluir la configuración cargada
  ...editorConfig
});
```

### 3. Exportar cualquier plantilla Astro a GrapesJS

Puedes usar el script `export_to_grapesjs.py` para exportar cualquier otra plantilla Astro a GrapesJS:

```bash
python export_to_grapesjs.py --project /ruta/a/otra/plantilla/astro --output ./salida
```

## Estructura de la Plantilla

La plantilla sigue la estructura estándar de Astro con la adición de un archivo de configuración para GrapesJS:

```
/
  ├── astro.config.mjs              # Configuración de Astro
  ├── grapesjs.config.json          # Configuración para GrapesJS
  ├── src/
  │   ├── layouts/
  │   │   └── project.astro         # Layout principal
  │   ├── pages/
  │   │   ├── index.astro           # Página principal
  │   │   ├── about.astro           # Página de acerca de
  │   │   └── projects.astro        # Página de proyectos
  │   ├── components/               # Componentes reutilizables
  │   │   ├── Nav.astro
  │   │   ├── Footer.astro
  │   │   ├── MainHead.astro
  │   │   └── PortfolioPreview.astro
  │   └── styles/
  │       └── global.css
  └── public/
      └── assets/                   # Activos estáticos
```

## Regiones Editables

Se han definido las siguientes regiones editables para GrapesJS:

- **hero**: El encabezado principal con imagen de fondo
- **main_content**: El contenido principal de la página
- **header**: La barra de navegación
- **footer**: El pie de página

## Componentes Disponibles

Los componentes Astro disponibles para usar en el editor son:

- **Nav**: Barra de navegación con enlaces y redes sociales
- **Footer**: Pie de página con copyright
- **MainHead**: Metadatos de la página y SEO
- **PortfolioPreview**: Tarjeta de vista previa de proyectos

## Esquema de Datos

La plantilla utiliza el siguiente esquema de datos:

```json
{
  "pages": {
    "index": {
      "title": "Título del sitio",
      "description": "Descripción del sitio",
      "coverImage": "URL de la imagen de portada",
      "subtitle": {
        "uperTitle": "Texto superior",
        "bottomTitle": "Texto inferior"
      },
      "roles": [
        { "role": "Rol 1" },
        { "role": "Rol 2" }
      ],
      "subDescription": "Descripción secundaria",
      "about": {
        "title": "Título sobre mí",
        "content": "Contenido sobre mí"
      },
      "milestones": [
        { "date": "2023", "text": "Descripción del hito" }
      ]
    }
  },
  "components": {
    "Footer": {
      "owner": "Nombre del propietario"
    },
    "MainHead": {
      "title": "Título por defecto",
      "description": "Descripción por defecto"
    },
    "Nav": {
      "monogram": "Iniciales",
      "socials": {
        "twitter": "URL de Twitter",
        "instagram": "URL de Instagram",
        "github": "URL de GitHub"
      }
    }
  }
}
```