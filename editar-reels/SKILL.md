---
name: editar-reels
description: >
  Edita videos verticales de una persona hablando a cámara (reels de Instagram, TikTok, YouTube
  Shorts) con HyperFrames: corta pausas, errores y tomas repetidas, pone subtítulos, textos grandes,
  gráficos y sonidos, y deja el video listo para revisar en la vista previa. Tiene dos estilos:
  LIMPIO (palabras grandes y pocos gráficos) y CARGADO (paneles, pantallas y más movimiento). Usala
  cuando el usuario te pase un video crudo y pida editarlo, cortarlo, subtitularlo o "hacer el reel",
  aunque no nombre la skill ni HyperFrames.
---

# Editar reels con Claude Code

Un video crudo grabado con el celular se convierte en un reel de 30 a 90 segundos, armado como una
composición de HyperFrames (HTML que se renderiza a video). La persona revisa en la vista previa y
recién ahí se renderiza.

## Antes de empezar

1. **HyperFrames instalado.** Si no están las skills `/hyperframes` y `/hyperframes-core`, pedile al
   usuario que corra `npx skills add heygen-com/hyperframes` (o instalalas vos si te deja). Leé
   `/hyperframes` y `/hyperframes-core` antes de escribir HTML: ahí están las reglas de la composición.
2. **ffmpeg instalado.** En Mac: `brew install ffmpeg`. En Windows: `winget install ffmpeg`.
3. **El estilo de la marca.** Leé `estilo/mi-marca.md`. Si está vacío, preguntá tipografía, color de
   acento y logo, o usá un estilo neutro (texto blanco con sombra suave y un solo color de acento).
4. **El estilo de edición.** El usuario dice LIMPIO o CARGADO. Si no lo dice, preguntá.
   - LIMPIO: leé `references/estilo-limpio.md`.
   - CARGADO: leé `references/estilo-cargado.md`.

## Reglas para los dos estilos

Salieron de editar decenas de reels y de las correcciones de quien los grababa. Respetalas aunque
parezcan detalles.

**Los primeros 5 segundos**
- Son lo más importante del video: ahí va el mejor diseño y el mejor sonido.
- El primer cuadro ya tiene texto en pantalla. Nunca arranca vacío.
- El texto grande del hook tiene menos de 5 palabras.

**Zona segura**
- En 1080 × 1920, todo lo importante va entre x 60–960 e y 220–1520. Fuera de esa zona, Instagram y
  TikTok lo tapan con sus botones y textos.

**Cámara**
- Un solo encuadre y un empuje lento y continuo (por ejemplo, escala 1.08 → 1.14 en todo el video).
- Nada de zooms de golpe, punch-ins ni idas y vueltas de zoom: cansan a la vista.
- Si el texto va arriba de la cabeza, escalá desde el borde de arriba (`transform-origin` arriba al
  centro), así la cabeza baja y deja lugar al texto.

**Subtítulos**
- Siempre puestos. De 1 a 3 palabras por bloque, como mucho 16 caracteres.
- Oración normal (no todo en mayúsculas), texto claro con una sombra suave, centrados debajo de la cara.
- Bloques de menos de 0,25 s se juntan con el siguiente. Cada bloque termina cuando empieza el otro
  (máximo 1,6 s).

**Gráficos**
- Nunca tapan la cara.
- Un solo elemento (un logo, una tarjeta, una lista) va centrado arriba de la cabeza, no al costado.
  Varias etiquetas juntas van en una fila centrada debajo de los subtítulos.
- Una idea gráfica por vez, grande. Sin etiquetas de relleno ni grillas de íconos iguales.
- Transformar, no reemplazar: lo nuevo sale de lo anterior (un botón pasa a su estado listo, una fila
  crece hasta ser una ficha). Sin fundidos cruzados, partículas ni brillos.
- Cada cambio cae en la palabra que lo nombra.
- Entradas rápidas que frenan (`expo.out`, 0,4–0,6 s, con un poco de desenfoque). Salidas que aceleran
  (`power2.in`, unos 0,2 s). Resortes casi sin rebote (`back.out(1.3)`).
- Nada queda quieto más de 1,5 s: si un panel espera, dale un empuje lento.
- Las interfaces se ven como el producto real y los logos son los reales. Si algo es un dato de
  ejemplo (un precio, un nombre), avisalo al entregar.
- Si el video cita una fuente (una noticia, una página oficial), mostrá una captura real de esa
  página y marcá la frase.

**Sonido**
- Pocos y bajos: como mucho 40 efectos por minuto, cada uno atado a algo que se ve (un pop cuando
  aparece un logo, un clic del cursor, un mensaje que entra).
- Como mucho un whoosh en todo el video. Nada de golpes, impactos ni booms.
- La voz es siempre lo más fuerte: voz a −14 LUFS y música de fondo muy por debajo (−27 a −33 LUFS),
  bajando cuando hay voz.
- Si no hay sonidos en `estilo/sonidos/`, pedile al usuario que baje algunos gratis (por ejemplo de
  Mixkit o Pixabay, revisando la licencia) o seguí sin efectos.

**Contenido**
- Leé la transcripción por el sentido, no solo por las palabras. Corregí lo que el reconocimiento
  escuchó mal.
- Si un dato parece viejo o equivocado, avisale al usuario. No cambies lo que dijo sin preguntar.

**Revisión**
- No renderices sin que el usuario haya visto la vista previa y la haya aprobado. Renderizar tarda y
  en computadoras con poca memoria se puede trabar.

## El manual que se mejora solo

Cada vez que el usuario corrija algo ("ese sonido no", "el texto más arriba"), anotalo en
`estilo/mi-marca.md`, en "Cosas que aprendimos", con la fecha y el motivo. Antes de cada edición se
lee ese archivo, así el mismo error no se repite.

## El proceso

1. **Proyecto nuevo.**
   ```bash
   npx hyperframes init "<carpeta>" --non-interactive --example=blank
   bash scripts/prep.sh "<video crudo>" "<carpeta>" es
   ```
   `prep.sh` hace una copia de trabajo en 1080 × 1920 a 30 fps, nivela la voz a −14 LUFS, transcribe
   palabra por palabra con su segundo exacto (`transcript.json`, en la carpeta del proyecto) y saca
   un cuadro con grilla para ubicar la cara (`.build/grid.jpg`). El último parámetro es el idioma
   (`es`, `en`, `pt`…). Para fijar una versión de HyperFrames:
   `HYPERFRAMES=hyperframes@<versión> bash scripts/prep.sh …`.

2. **Tomas crudas con errores y repeticiones.** Si la persona repite frases, hace pausas largas o mira
   el celular entre líneas:
   - Buscá los tramos de voz en un audio limpio (filtro de ruido y nivel mayor a unos −58 dB).
   - Transcribí cada tramo por separado: transcribir todo junto corre los tiempos y a veces inventa
     palabras en los silencios.
   - Quedate con la mejor toma de cada frase.
   - Dejá 0,08 s antes y 0,14 s después de cada corte, con fundidos de audio de 20–30 ms.
   - Revisá un cuadro cada 0,25 s para descartar tomas donde mira para abajo.
   - Uní todo en una sola toma continua y armá la edición sobre esa toma.

3. **Pausas.** Toda pausa de 0,3 s o más se acorta a unos 0,14 s.

4. **Planificá los momentos.** Una idea por frase. Elegí un tratamiento para cada una según el estilo.
   Mostrale al usuario 4 o 5 momentos de muestra antes de editar todo el video: ahí se define el gusto.

5. **Armá la composición** siguiendo `/hyperframes-core`. Para texto detrás de la persona, recortala
   del fondo en ventanas cortas con `scripts/matte.sh` (en una Mac con chip M, unos 7 s por cada
   segundo de video).

6. **Revisá sin renderizar.**
   ```bash
   npx hyperframes lint
   npx hyperframes snapshot --at <segundos de cada momento>
   ```
   Mirá cada cuadro. Corregí todos los errores del lint. Para las transiciones, mirá cuadros a 10 por
   segundo.

7. **Entregá en la vista previa.** `npx hyperframes preview` y pasale la dirección al usuario. Sumá una
   tabla con cada momento y una lista de lo que tiene que revisar (datos de ejemplo, palabras
   dudosas de la transcripción, datos para chequear). En cada ronda de cambios, aplicá las notas,
   sacá capturas de nuevo y anotá lo aprendido en `estilo/mi-marca.md`.

8. **Versión final** (solo cuando el usuario la aprueba).
   - Antes de renderizar, cambiá la copia de trabajo por el video original en alta resolución, así el
     final no se ve estirado.
   - `npx hyperframes render`: 1080 × 1920 alcanza para Instagram y TikTok. Para 4K vertical,
     `--resolution portrait-4k`. Con poca memoria, `--workers 2`.
   - El render suele salir con el volumen bajo: normalizá a −14 LUFS al final.
   - Archivos por plataforma: Instagram y TikTok en 1080 × 1920, H.264, unos 16 Mb/s, audio AAC 128k.
     YouTube Shorts puede ir en 2160 × 3840.

## Lecciones técnicas (cada una costó un render)

- **Muchos cortes:** no encadenes tramos con `tweenFromTo` en una línea de tiempo maestra (el
  renderizador busca fuera de orden y aparecen dos subtítulos a la vez). Manejá todo con un solo reloj
  que traduce el tiempo del reel al tiempo de la toma original.
- **Volumen:** `data-volume` en el `<audio>` no siempre se escucha. Nivelá el archivo de voz antes
  (lo hace `prep.sh`).
- **Texto detrás de la persona:** el orden es video → texto → recorte de la persona encima. El texto
  tiene que desaparecer antes de que termine la ventana del recorte, o salta delante de la cabeza.
  Ubicá la palabra para que el pelo tape solo la parte de abajo de las letras.
- **Letras animadas una por una:** si cada letra es un `inline-block`, los espacios se pierden; usá
  espacios de no separación.
- **Números:** no uses `toLocaleString` (el idioma del renderizador puede cambiar). Formatealos a mano.
- **GSAP no anima `className`:** animá el color directamente.
- **La transcripción** a veces "oye" una palabra que falta en un corte porque la gramática la pide.
  Si un corte suena raro, que el usuario lo escuche. Si una escena quedó lenta y desprolija, suele
  ser mejor sacarla entera que acelerarla o cortar palabras sueltas.
