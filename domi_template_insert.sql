-- Script SQL para la integración de la plantilla advopg con el editor GrapesJS en DOWI

-- 1. Obtener el ID de la plantilla (asumimos que ya existe una plantilla con nombre 'Astro Portfolio')
-- Si no existe la plantilla, deberá crearla primero

-- Insertar o actualizar los datos del editor GrapesJS para la plantilla
UPDATE templates 
SET gjs_data = '{
  "html": "<header class=\"hero\"><img class=\"img\" src=\"https://images.unsplash.com/photo-1668026067701-48b0b7dbdc47?w=1200&q=75\" width=\"1600\" height=\"1131\" sizes=\"(max-width: 800px) 800px, (max-width: 1200px) 1200px, (max-width: 1600px) 1600px, (max-width: 2400px) 2400px, 1200px\"><div class=\"overlay\"><h1 class=\"title\"><small class=\"subtitle\">The personal site of</small>Alder Velasquez</h1><div class=\"roles\"><span class=\"role\">👩‍💻 Developer<span class=\"invert\">👩‍💻 Developer</span></span><span class=\"role\">📸 Photographer<span class=\"invert\">📸 Photographer</span></span><span class=\"role\">🎮 Gamer<span class=\"invert\">🎮 Gamer</span></span></div><p class=\"desc\">Full-Stack developer from Spain</p></div></header><main class=\"wrapper\"><div class=\"grid\"><div class=\"section\"><h3 class=\"sectionTitle\">Selected Work</h3><div class=\"buttonContainer\"><a href=\"/projects/\" class=\"button\">View All</a></div></div><div class=\"section\"><h3 class=\"sectionTitle\">About Me</h3><div class=\"bio\"><p>My name is Alder, and I am a passionate cross-platform developer based in Spain. My journey into the world of technology began early in life and has been defined by curiosity, determination, and a relentless drive to learn and grow.</p><p>Born in Jinotepe, Nicaragua, I moved to Spain in 2010, where my love for computers and programming truly flourished. Over the years, I have worked hard to turn this passion into a career, graduating as a Cross-Platform Application Developer in 2021. Since then, I have been honing my skills as a BackEnd-oriented developer at CIC, where I specialize in creating robust and innovative solutions.</p></div><div class=\"timeline-wrapper\"><h4>Key Milestones</h4><ol class=\"timeline\"><li><span><strong>2000: </strong></span>Born in Jinotepe, Nicaragua.</li><li><span><strong>2010: </strong></span>Moved to Spain, where I discovered my passion for technology.</li><li><span><strong>2021: </strong></span>Graduated as a Cross-Platform Application Developer.</li><li><span><strong>Present: </strong></span>Working at CIC as a BackEnd-oriented developer, constantly learning and improving.</li></ol></div><p class=\"read-more\"><a href=\"/about\">Discover more about</a></p></div></div></main>",
  "css": ".hero{position:relative;overflow:hidden}@media (min-width: 750px){.hero{height:45vw}}.img{display:block;width:100%;height:auto}.overlay{position:absolute;top:0;left:0;width:100%;height:100%;z-index:10;display:flex;flex-direction:column;align-items:flex-start;justify-content:center;padding-left:2rem}@media (min-width: 750px){.overlay{padding-left:4rem}}.title{font-weight:900;font-size:var(--f-u6);margin-bottom:.5rem;margin-top:0}@media (min-width: 750px){.title{font-size:var(--f-u12)}}.grid{display:grid;grid-gap:2rem}@media (min-width: 1200px){.grid{grid-template-columns:2fr 1fr}}.sectionTitle{font-weight:700;font-size:var(--f-u8);margin-top:4rem;margin-bottom:2rem}.roles{display:flex;flex-wrap:wrap;gap:.5em;font-size:var(--f-d1)}.role{position:relative;display:inline-block;white-space:nowrap;font-weight:900;color:var(--t-bg);background-color:var(--t-fg);padding:.25em .5em;z-index:2}@media (min-width: 750px){.role{font-size:var(--f-u3)}}.role:nth-of-type(1) .invert{background-color:var(--c-pink)}.role:nth-of-type(2) .invert{background-color:var(--c-blue)}.role:nth-of-type(3) .invert{background-color:var(--c-green)}.role:nth-of-type(4) .invert{background-color:var(--c-orange)}.role:nth-of-type(5) .invert{background-color:var(--c-yellow)}.role:nth-of-type(6) .invert{background-color:var(--c-white)}.role:hover .invert{clip-path:polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)}.invert{position:absolute;color:var(--t-fg);display:flex;align-items:center;justify-content:center;width:100%;height:100%;top:0;left:0;pointer-events:none;clip-path:polygon(0% 100%, 100% 100%, 100% 200%, 0% 200%);transition:clip-path cubic-bezier(0.4,0,0.5,1) 150ms}.desc{font-size:var(--f-u1);margin-top:1.5rem;margin-bottom:0}.subtitle{display:block;font-weight:400;font-size:var(--f-d6);letter-spacing:-.0625em}.bio{line-height:2;margin-bottom:2rem}.bio>span:first-of-type{line-height:1;margin-bottom:.5em;display:block;font-weight:700;font-size:var(--f-u4);text-decoration:none}.bio>span{line-height:1;font-weight:700;font-size:1em;text-decoration:underline}.buttonContainer{text-align:center;margin-top:2em}.timeline{list-style-type:none;padding:0}.timeline li{margin-bottom:1rem}.timeline span{font-weight:700}",
  "styles": [],
  "components": [],
  "assets": [],
  "editable_regions": [
    {
      "id": "hero",
      "name": "Hero Section",
      "selector": "header.hero"
    },
    {
      "id": "main_content",
      "name": "Main Content",
      "selector": "main.wrapper"
    },
    {
      "id": "header",
      "name": "Navigation",
      "selector": "nav"
    },
    {
      "id": "footer",
      "name": "Footer",
      "selector": "footer"
    }
  ],
  "editor_schema": {
    "pages": [
      {
        "id": "index",
        "name": "Homepage",
        "astroTemplateFile": "src/pages/index.astro",
        "route": "/"
      },
      {
        "id": "about",
        "name": "About",
        "astroTemplateFile": "src/pages/about.astro",
        "route": "/about"
      },
      {
        "id": "projects",
        "name": "Projects",
        "astroTemplateFile": "src/pages/projects.astro",
        "route": "/projects"
      }
    ],
    "dataSchema": {
      "pages": {
        "index": {
          "title": "string",
          "description": "string",
          "coverImage": "string",
          "subtitle": {
            "uperTitle": "string",
            "bottomTitle": "string"
          },
          "roles": [
            {
              "role": "string"
            }
          ],
          "subDescription": "string",
          "about": {
            "title": "string",
            "content": "string"
          },
          "milestones": [
            {
              "date": "string",
              "text": "string"
            }
          ]
        },
        "about": {
          "title": "string",
          "description": "string",
          "content": [
            {
              "text": "string"
            }
          ]
        }
      },
      "components": {
        "Footer": {
          "owner": "string"
        },
        "MainHead": {
          "title": "string",
          "description": "string"
        },
        "Nav": {
          "monogram": "string",
          "socials": {
            "twitter": "string",
            "instagram": "string",
            "github": "string"
          }
        }
      }
    }
  }
}'
WHERE name = 'Astro Portfolio';

-- 2. Insertar componentes Astro para la plantilla
-- Primero, obtenemos el ID de la plantilla
DO $$
DECLARE
    template_id INT;
BEGIN
    -- Obtener el ID de la plantilla
    SELECT id INTO template_id FROM templates WHERE name = 'Astro Portfolio';
    
    IF template_id IS NULL THEN
        RAISE EXCEPTION 'La plantilla "Astro Portfolio" no existe';
    END IF;
    
    -- Limpiar componentes existentes si es necesario
    DELETE FROM astro_components WHERE template_id = template_id;
    
    -- Insertar el componente Nav
    INSERT INTO astro_components (template_id, name, path, content, props, category, created_at, updated_at)
    VALUES (template_id, 'Nav', '/components/Nav.astro', 
    '---
import siteConfig from ''../content/web-data.json'';
const { components } = siteConfig;
---

<nav>
	<a class="link" href="/">
		<div class="monogram">{ components.Nav.monogram }</div>
	</a>
	<a class="link" href="/projects/"> Portfolio</a>
	<a class="link" href="/about/"> About me</a>
	<div class="socials">
		<a class="social" href={components.Nav.socials.twitter}>
			<svg
				class="socialIcon"
				xmlns="http://www.w3.org/2000/svg"
				viewBox="0 0 16 16"
			>
				<path
					d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"
				></path>
			</svg>
		</a>
		<a class="social" href={components.Nav.socials.github}>
			<svg
				class="socialIcon"
				xmlns="http://www.w3.org/2000/svg"
				viewBox="0 0 16 16"
			>
				<path
					d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"
				></path>
			</svg>
		</a>
		<a class="social" href={components.Nav.socials.instagram}>
			<svg
				xmlns="http://www.w3.org/2000/svg"
				width="16"
				height="16"
				fill="currentColor"
				class="socialIcon"
				viewBox="0 0 16 16"
			>
				<path
					d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"
				></path>
			</svg>
		</a>
	</div>
</nav>

<style>
	nav {
		display: flex;
		gap: 1rem;
		align-items: center;
		padding: 1rem;
		

	}

	.link {
		color: var(--t-subdue);
		display: block;
		text-decoration: none;
		font-size: var(--f-d1);
		text-transform: uppercase;
		padding-top: 0.75em;
		padding-bottom: 0.75em;
		
	}

	.link:hover,
	.link:focus {
		color: var(--t-active);
	}

	.monogram {
		display: flex;
		align-items: center;
		justify-content: center;
		width: 2em;
		height: 2em;
		margin-right: 0.5rem;
		color: var(--c-black);
		font-weight: 900;
		letter-spacing: -0.125rem;
		border: 3px solid currentColor;
	}

	.socials {
		display: flex;
		gap: 0.75em;
		margin-left: auto;
	}

	.social {
		display: block;
	}

	.socialIcon {
		display: block;
		width: 1.25rem;
		height: 1.25rem;
		fill: var(--t-subdue);
		transition: fill linear 150ms;
	}

	.socialIcon:hover {
		fill: var(--t-active);
	}
</style>',
    '{"monogram": {"type": "string", "required": true}, "socials": {"type": "object", "properties": {"twitter": {"type": "string"}, "github": {"type": "string"}, "instagram": {"type": "string"}}}}',
    'Layout', NOW(), NOW());
    
    -- Insertar el componente Footer
    INSERT INTO astro_components (template_id, name, path, content, props, category, created_at, updated_at)
    VALUES (template_id, 'Footer', '/components/Footer.astro', 
    '---
import siteConfig from ''../content/web-data.json'';
const { components } = siteConfig;
---

<footer>
	<div class="group">
		<p>
			Designed & Developed with ❤️ by <a href="/">{ components.Footer.owner }</a>
		</p>
		<p>&copy; {new Date().getFullYear()} Astro Portfolio</p>
	</div>
	<p class="socials">
		<a href="https://twitter.com/me"> Twitter</a>
		<a href="https://github.com/me"> GitHub</a>
		<a href="https://codepen.io/me"> CodePen</a>
	</p>
</footer>
<style>
	footer {
		display: flex;
		flex-direction: column;
		gap: 3rem;
		margin-top: auto;
		padding: 3rem 2rem 3rem;
		text-align: center;
		color: var(--t-subdue);
		font-size: var(--f-d1);
	}

	.group {
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
	}

	.socials {
		display: flex;
		justify-content: center;
		gap: 1rem;
		flex-wrap: wrap;
	}

	@media (min-width: 50em) {
		footer {
			flex-direction: row;
			justify-content: space-between;
			padding: 2.5rem 5rem;
		}

		.group {
			gap: 0.5rem;
		}

		.socials {
			justify-content: flex-end;
		}
	}
</style>
',
    '{"owner": {"type": "string", "required": true}}',
    'Layout', NOW(), NOW());
    
    -- Insertar el componente MainHead
    INSERT INTO astro_components (template_id, name, path, content, props, category, created_at, updated_at)
    VALUES (template_id, 'MainHead', '/components/MainHead.astro', 
    '---
import ''../styles/global.css'';
import siteConfig from ''../content/web-data.json'';
const { components } = siteConfig;
const {
	title = components.MainHead.title,
	description = components.MainHead.description,
} = Astro.props;
---

<meta charset="UTF-8" />
<meta name="description" property="og:description" content={description} />
<meta name="viewport" content="width=device-width" />
<meta name="generator" content={Astro.generator} />
<title>{title}</title>

<link rel="icon" type="image/svg+xml" href="/favicon.svg" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@200;400;700;900&display=swap"
	rel="stylesheet"
/>',
    '{"title": {"type": "string", "required": true}, "description": {"type": "string", "required": true}}',
    'SEO', NOW(), NOW());
    
    -- Insertar el componente PortfolioPreview
    INSERT INTO astro_components (template_id, name, path, content, props, category, created_at, updated_at)
    VALUES (template_id, 'PortfolioPreview', '/components/PortfolioPreview.astro', 
    '---
import type { Project } from ''../types'';

interface Props {
	project: Project;
}

const { project } = Astro.props;
---

<a class="card" href={project.url}>
	<span class="title">{project.frontmatter.title}</span>
	<img
		src={project.frontmatter.img}
		alt={project.frontmatter.img_alt || ''''}
		loading="lazy"
		decoding="async"
	/>
</a>

<style>
	.card {
		display: grid;
		grid-template: auto 1fr / auto 1fr;
		height: 11rem;
		background: var(--gradient-subtle);
		border: 1px solid var(--gray-800);
		border-radius: 0.75rem;
		overflow: hidden;
		box-shadow: var(--shadow-sm);
		text-decoration: none;
		font-family: var(--font-brand);
		font-size: var(--text-lg);
		font-weight: 500;
		transition: box-shadow var(--theme-transition);
	}

	.card:hover {
		box-shadow: var(--shadow-md);
	}

	.title {
		grid-area: 1 / 1 / 2 / 2;
		z-index: 1;
		margin: 0.5rem;
		padding: 0.5rem 1rem;
		background: var(--gray-999);
		color: var(--gray-200);
		border-radius: 0.375rem;
	}

	img {
		grid-area: 1 / 1 / 3 / 3;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}

	@media (min-width: 50em) {
		.card {
			height: 22rem;
			border-radius: 1.5rem;
		}

		.title {
			border-radius: 0.9375rem;
		}
	}
</style>
',
    '{"project": {"type": "object", "required": true, "properties": {"frontmatter": {"type": "object", "properties": {"title": {"type": "string"}, "description": {"type": "string"}, "img": {"type": "string"}, "tags": {"type": "array", "items": {"type": "string"}}}}, "url": {"type": "string"}}}}',
    'UI', NOW(), NOW());
    
END $$;