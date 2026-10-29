#!/usr/bin/env bash
# matte.sh <carpeta_del_proyecto> <segundo_inicio> <duración> <nombre>
# Recorta a la persona del fondo en una ventana corta → assets/video/<nombre>_fg.webm
# Para "texto detrás de la persona". Ventanas cortas (1–4 s): en una Mac con chip M tarda
# unos 7 s por cada segundo de video; sin aceleración, bastante más.
set -euo pipefail
P="$1"; SS="$2"; D="$3"; N="$4"
HF="${HYPERFRAMES:-hyperframes}"   # para fijar una versión: HYPERFRAMES=hyperframes@0.8.212
ffmpeg -v error -y -ss "$SS" -i "$P/assets/video/raw.mp4" -t "$D" -an -c:v libx264 -crf 14 "$P/.build/$N.mp4"
( cd "$P" && npx -y "$HF" remove-background ".build/$N.mp4" -o "assets/video/${N}_fg.webm" --quality best )
echo "El recorte empieza en el segundo $SS del video: data-media-start = (segundo en la toma - $SS)"
