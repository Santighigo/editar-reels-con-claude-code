# Estilo CARGADO

El video se queda en la cara la mayor parte del tiempo y corta a un momento diseñado cada 4–8 s.
Ritmo que funcionó: cara ~60 %, paneles en la mitad de arriba ~20 %, pantalla completa ~20 %. Algo
cambia cada 1–3 s (un pop, un color en el subtítulo), nunca un zoom de golpe.

## Sobre la cara (la mayor parte del video)

| Tratamiento | Cuándo | Cómo |
|---|---|---|
| **Desenfoque que se aclara** | Al abrir, o al volver a la cara después de un panel | Desenfoque 16–22 px → 0 sobre la cámara |
| **Empuje lento** | Frases con tensión | Escala que sube muy despacio, siempre en la misma dirección |
| **Logo arriba de la cabeza** | Se nombra una app o producto | Un logo grande centrado arriba de la cabeza, con un pop |
| **Etiquetas en fila** | Se enumeran 2 a 4 cosas | Etiquetas que entran de a una, fila centrada debajo de los subtítulos |
| **Dos burbujas** | Se comparan dos opciones | Una burbuja a la izquierda y otra a la derecha, levemente inclinadas |
| **Texto detrás de la cabeza** | Una palabra o número clave ("gratis", "$0") | Recorte de la persona encima del texto; como mucho 1,6 s |
| **Tarjeta borrosa** | Algo que todavía no se sabe | El valor desenfocado y una etiqueta "sin publicar" |
| **Fecha** | Se dice una fecha | Una hoja de calendario con el número que aparece |
| **Cursor** (como mucho 3 por video, nunca en el hook) | Elegir entre dos opciones, tocar un link, señalar una fuente | La punta del cursor cae exacto en el objetivo |

## Panel en la mitad de arriba

La cara baja a la mitad de abajo y arriba entra un panel claro. Los subtítulos bajan con ella (y ≈ 1590).
Sirve para explicaciones de 2 a 8 s: una notificación, una conversación de dos burbujas, un flujo
(logo → línea que se dibuja → logo), una bandeja de entrada con filas que entran.

## Pantalla completa

| Tratamiento | Cómo |
|---|---|
| **Chat en un celular** | El celular entra desde abajo, las burbujas aparecen en cada frase, puntos de "escribiendo", el cursor toca el elemento |
| **Fuente oficial** | Captura real de la página, zoom a la frase y marcado. Acá va el único whoosh del video |
| **Palabra que se abre** | Video dentro de las letras de la palabra clave, la palabra crece y deja ver el video |
| **Título sobre fondo oscuro** | Pocas palabras grandes que entran de a una, la clave en color de acento |
| **Clip de stock** | Moderno, a color, a pantalla completa con un empuje lento. Con moderación |

## Guardas de ritmo

- Un momento diseñado cada 4–8 s. Nunca dos pantallas completas seguidas, salvo que una continúe a la
  otra con un zoom.
- Cada momento se sostiene al menos 1,2 s para que se lea. Salidas de 0,1–0,16 s, entradas de
  0,3–0,5 s.
- Los gráficos salen antes de que los subtítulos cambien de lugar.
- Para tomar capturas de páginas reales: Chrome sin interfaz a 3× (`--headless --hide-scrollbars
  --force-device-scale-factor=3 --window-size=800,1100 --screenshot=out.png <url>`).
