# Editar reels con Claude Code

Una skill para que Claude Code edite tus videos verticales (reels, TikTok, Shorts): corta pausas y
errores, pone subtítulos, textos grandes, gráficos y sonidos, y te deja el video listo para revisar
antes de exportarlo.

Son las reglas con las que se editan mis reels, sin mi estilo de marca. El tuyo lo cargás vos en un
archivo.

## Qué necesitás

- **Claude Code**, la versión de Claude que trabaja dentro de tu computadora. Viene con el plan pago
  de Claude.
- **HyperFrames**, un programa gratis y de código abierto de HeyGen que le enseña a Claude a armar
  videos.
- **ffmpeg**, para procesar el video. En Mac: `brew install ffmpeg`. En Windows: `winget install ffmpeg`.

## Instalación

1. Instalá HyperFrames:
   ```bash
   npx skills add heygen-com/hyperframes
   ```
   También podés instalarlo como plugin de Claude Code, como indica el
   [README de HyperFrames](https://github.com/heygen-com/hyperframes):
   `claude plugin marketplace add heygen-com/hyperframes` y después
   `claude plugin install hyperframes@hyperframes`.
2. Instalá esta skill:
   ```bash
   git clone https://github.com/Santighigo/editar-reels-con-claude-code
   cp -r editar-reels-con-claude-code/editar-reels ~/.claude/skills/
   ```
   O abrí Claude Code y pedile: *"Instalá la skill de este repo: https://github.com/Santighigo/editar-reels-con-claude-code"*.

## Cómo se usa

1. Completá `~/.claude/skills/editar-reels/estilo/mi-marca.md` con tus tipografías, colores y lo que
   no querés nunca. Si lo dejás vacío, Claude usa un estilo neutro.
2. Abrí Claude Code en una carpeta y pedile:
   > Editá este video en estilo limpio: `mi-video.mp4`
3. Revisá el video en la vista previa que te abre y pedí cambios como se los pedirías a un editor:
   *"esta palabra más grande"*, *"este corte más tarde"*.
4. Cuando te guste, pedile que lo exporte.

Cada vez que corregís algo, Claude lo anota en `mi-marca.md`. Así no repite el error en el próximo video.

## Los dos estilos

- **Limpio:** palabras grandes arriba de la cabeza, subtítulos chicos, pocos gráficos y un clic de
  cámara en cada palabra grande.
- **Cargado:** paneles, pantallas completas, chats y capturas de fuentes reales. Más movimiento.

## Qué tiene adentro

```
editar-reels/
├── SKILL.md                 Las reglas y el proceso paso a paso
├── references/
│   ├── estilo-limpio.md
│   └── estilo-cargado.md
├── estilo/
│   └── mi-marca.md          Tu marca y lo que Claude va aprendiendo
└── scripts/
    ├── prep.sh              Prepara el video y lo transcribe
    └── matte.sh             Recorta a la persona para poner texto detrás
```

## Tené en cuenta

- El primer video lleva más tiempo, hasta que `mi-marca.md` queda armado.
- Renderizar usa mucha memoria. En computadoras de 8 GB, exportá en 1080 × 1920.
- Los efectos de sonido no vienen incluidos: bajalos gratis (por ejemplo de Mixkit o Pixabay, revisando
  la licencia) y ponelos en `estilo/sonidos/`.

Hecho por Santino Ghigo · [@santinoghigo](https://instagram.com/santinoghigo)

Licencia MIT.
