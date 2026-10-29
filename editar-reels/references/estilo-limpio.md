# Estilo LIMPIO

Un video poco cargado: la edición se queda en la cara casi todo el tiempo y el movimiento está en las
palabras, no en paneles. Todo lo que no se cambia acá sigue las reglas de `SKILL.md`.

| | LIMPIO | CARGADO |
|---|---|---|
| Recurso principal | Palabras grandes arriba de la cabeza, de a una por vez | Paneles, pantallas completas, videos de stock |
| Gráficos | 2–3 tarjetas cortas en todo el video y algunos logos | Un momento diseñado cada 4–8 s |
| Texto detrás de la cabeza | El título del hook y como mucho una palabra más | Varias veces |
| Sonido característico | Un clic de cámara en cada palabra grande | Pops y sonidos de mensajes |
| Música | Más presente (unos −27 LUFS) | Más baja (unos −33 LUFS) |
| Stock | Ninguno | Clips modernos y a color |

## Palabras grandes: el recurso principal

- **Tipografía:** la de títulos de la marca, muy gruesa (800), interletrado −0,05em, interlineado 1.
  Blanca, con una sombra suave. La palabra destacada va en el color de acento.
- **Tamaño:** `min(170, floor(860 / (caracteres × 0.56)))` px, centrada en una caja entre x 100–980 e
  y 215–415 (la pared arriba de la cabeza, dentro de la zona segura).
- **De a un bloque por vez,** 1 o 2 palabras, sincronizado con el inicio de la palabra. Entra en 0,14 s
  (escala 0.86 → 1, sube 18 px, desenfoque 8 → 0). Sale cuando empieza el siguiente. Mientras hay una
  palabra grande, el subtítulo chico se oculta.
- **Qué va en grande:** lo fuerte de cada frase: el resultado, el número, el concepto clave o la
  solución. No el relleno ni el problema repetido.
- Unos 20 bloques grandes en un video de 50 s, agrupados en 6 o 7 tandas, nunca dos tandas pegadas.
  Una palabra en color de acento por tanda, casi siempre la última.

## Subtítulos chicos

56 px, peso 700, oración normal, blancos con sombra. Debajo del mentón en los momentos de cara; en
color oscuro cuando van sobre una tarjeta blanca.

## Cámara

Escalá desde el borde de arriba, así cada zoom baja la cabeza y deja libre la pared para las palabras.
Un encuadre para el hook y un solo empuje lento en todo el cuerpo del video (por ejemplo 1.08 → 1.14).
Antes de seguir, comprobá que la cabeza no choque con la caja de las palabras en la escala más baja.

## Los primeros 5 segundos

1. **El primer cuadro ya se lee:** la primera línea del hook escrito ya está en pantalla (unos 110 px).
2. **La segunda línea aparece detrás de la cabeza** en la palabra clave dicha: en color de acento,
   unos 140 px, escala 1.35 → 1 con desenfoque, 0,3 s. Necesita el recorte de la persona
   (`scripts/matte.sh`) durante el hook. Sin sonido de impacto.
3. **El visual del hook va a la altura del pecho,** debajo de los subtítulos: un solo objeto que parece
   real (unas notificaciones, una planilla que se llena, un chat).
4. Todo sale unos 0,2 s antes de que termine el hook.
5. El cuerpo arranca con una frase fuerte y palabras grandes en los primeros 2–3 s.

## Los pocos gráficos permitidos

- **Tarjetas blancas:** entran y salen de corte, con el contenido apareciendo en las palabras dichas.
  Cortas: unos 3,5 s como mucho. Si una tabla necesita más tiempo, contá el resto con palabras grandes
  y logos.
- **Logos arriba de la cabeza** (unos 190 px): uno cuando se nombra; dos unidos por una línea para un
  flujo ("de la planilla al mail"). Reusá los mismos logos entre frases en vez de cambiarlos.

## Sonido

- Un clic de cámara (`shutter.mp3`) en cada palabra grande, uno por bloque en pantalla (sin repetir
  si dos caen a menos de 0,25 s).
- El resto, el kit normal: un pop fuerte al abrir, sonidos de mensaje para notificaciones, clic para
  el cursor, pop suave para logos y tarjetas.
- Nada de golpes ni impactos debajo de las palabras.

## Varias versiones del hook con una sola toma

Si la persona grabó dos o tres hooks seguidos y después el cuerpo:
- Armá **solo la versión A** y entregala. Las otras se arman recién cuando A está aprobada (hacer todas
  juntas duplica el trabajo si hay cambios).
- Cada versión usa el mismo cuerpo y corta los hooks que no le tocan.
- Si una versión necesita un poco más de ritmo, acelerala lo mínimo (1.03×), sin cambiar el tono de voz.
- Sacá los conectores sueltos que queden al principio después de un corte ("Y…").
