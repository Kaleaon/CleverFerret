import requests

token = "k6k6jyYgzt3EmsmPjNmTFuEt5Wdd59ML13s8MFUV"
headers = {"Authorization": f"Token {token}"}

queries = {
    "rainforest": "Rainforest Rain",
    "waves": "Ocean Waves",
    "wind": "Strong Wind"
}

for key, query in queries.items():
    print(f"Searching for {query}...")
    url = f"https://freesound.org/apiv2/search/text/?query={query}&sort=rating_desc&fields=id,name,previews,username,license&page_size=3"
    try:
        response = requests.get(url, headers=headers, timeout=10)
        if response.status_code == 200:
            results = response.json().get('results', [])
            for res in results:
                print(f"ID: {res['id']}, Name: {res['name']}, Preview: {res['previews'].get('preview-hq-mp3')}, License: {res['license']}")
        else:
            print(f"Error: {response.status_code} {response.text}")
    except Exception as e:
        print(f"Exception: {e}")
    print("-" * 20)
