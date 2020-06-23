#!/bin/sh

servername=$(basename $PWD)

log () {
  echo -e "\e[1;43m$@\e[0m"
}
export -f log

progress () {
  srcdir="$1"
  total=`find "$srcdir" -type f | wc -l`
  i=0
  echo -e "\e[1mArchiving file\e[0m $i / $total"
  while read current; do
    [ -d "$current" ] && continue
    i=$((i+1))
    echo -e "\e[1A\e[K\e[1mArchiving file\e[0m $i / $total\e"
  done
}
export -f progress

archive () {
  archiver=$1
  archive_name="$2"
  source_dir="$3"
  case $archiver in
    7z)
      7z a -mx=9 -myx=9 "$archive_name.7z" "$source_dir";;
    zstd)
      tar -I zstd -cvf "$archive_name.tar.zst" "$source_dir" | progress "$source_dir";;
    *)
      log "Warning, unknown archiver '$archiver' !";;
  esac
}


log "Stopping services..."
docker-compose stop

log "Archiving to 7z..."
archive zstd "${servername}-$(date '+%Y%m%d-%H%M%S')" data/
#7z a -mx=9 -myx=9 ${servername}-$(date "+%Y%m%d-%H%M%S").7z data/

log "Starting services..."
docker-compose start
