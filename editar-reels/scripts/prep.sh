#!/usr/bin/env bash
# prep.sh <video_crudo> <carpeta_del_proyecto> [idioma]
# Copia de trabajo 1080x1920@30, voz nivelada a -14 LUFS, transcripción palabra por palabra
# y un cuadro con grilla para ubicar la cara. Idioma por defecto: es.
set -euo pipefail
RAW="$1"; P="$2"; LANG_CODE="${3:-es}"
HF="${HYPERFRAMES:-hyperframes}"   # para fijar una versión: HYPERFRAMES=hyperframes@0.8.212
command -v ffmpeg >/dev/null || { echo "Falta ffmpeg (Mac: brew install ffmpeg)"; exit 1; }
mkdir -p "$P/assets/video" "$P/assets/audio" "$P/.build"

# Copia de trabajo liviana: se edita sobre esta y el final usa el original
ffmpeg -v error -y -i "$RAW" -vf "scale=1080:1920:flags=lanczos,fps=30" -c:v libx264 -preset medium -crf 16 -pix_fmt yuv420p -g 15 -c:a aac -b:a 192k "$P/assets/video/raw.mp4"

# El audio del celular suele venir bajo y data-volume no es confiable: se nivela el archivo
ffmpeg -v error -y -i "$P/assets/video/raw.mp4" -vn -af "highpass=f=70,acompressor=threshold=-24dB:ratio=3:attack=5:release=80:makeup=4,loudnorm=I=-14:TP=-1.5:LRA=9" -ar 48000 -ac 2 "$P/assets/audio/voice.wav"

# Transcripción con tiempos por palabra (escribe transcript.json en la carpeta del proyecto)
npx -y "$HF" transcribe "$P/assets/audio/voice.wav" --dir "$P" --model small --language "$LANG_CODE"

# Cuadro con grilla para medir dónde está la cara
ffmpeg -v error -y -ss 3 -i "$P/assets/video/raw.mp4" -frames:v 1 -vf "drawgrid=w=108:h=192:t=2:c=red@0.6" "$P/.build/grid.jpg"

echo "Duración: $(ffprobe -v error -show_entries format=duration -of csv=p=0 "$P/assets/video/raw.mp4") s"
echo "Transcripción → $P/transcript.json · grilla → $P/.build/grid.jpg"
