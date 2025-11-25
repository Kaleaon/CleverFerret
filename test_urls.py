import requests

urls = [
    "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Scott_Holmes_Music/Corporate_Presentation/Scott_Holmes_Music_-_Driven_To_Success.mp3",
    "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Kevin_MacLeod/YouTube_Audio_Library/Kevin_MacLeod_-_Night_on_the_Docks_Trumpet_Mix.mp3",
    "https://prod-pleer.jamendo.com/?trackid=1384146&format=mp32",
    "https://bbcsfx.acropolis.org.uk/assets/07031428.wav",
    "https://freesound.org/data/previews/415/415209_5121236-lq.mp3",
    "https://prod-pleer.jamendo.com/?trackid=1450211&format=mp32",
    "http://as-hls-ww-live.akamaized.net/pool_01505109/live/ww/bbc_radio_one/bbc_radio_one.isml/bbc_radio_one-audio%3d96000.norewind.m3u8",
    "http://stream.live.vc.bbcmedia.co.uk/bbc_world_service"
]

for url in urls:
    try:
        response = requests.head(url, timeout=5, allow_redirects=True)
        print(f"URL: {url}\nStatus: {response.status_code}\n")
    except Exception as e:
        print(f"URL: {url}\nError: {e}\n")
