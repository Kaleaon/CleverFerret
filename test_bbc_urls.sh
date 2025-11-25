#!/bin/bash
urls=(
    "http://stream.live.vc.bbcmedia.co.uk/bbc_world_service"
    "http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-einws"
    "http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_world_service.m3u8"
    "http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_vlow/ak/bbc_world_service.m3u8"
    "https://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_world_service.m3u8"
)

for url in "${urls[@]}"; do
    echo "Checking $url"
    curl -I -L --max-time 5 "$url" 2>/dev/null | head -n 1
    echo ""
done
