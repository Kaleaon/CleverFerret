#!/bin/bash
token="k6k6jyYgzt3EmsmPjNmTFuEt5Wdd59ML13s8MFUV"

queries=("Rainforest+Rain" "Ocean+Waves" "Strong+Wind")

for query in "${queries[@]}"; do
    echo "Searching for $query..."
    curl -s -H "Authorization: Token $token" "https://freesound.org/apiv2/search/text/?query=$query&sort=rating_desc&fields=id,name,previews,username,license&page_size=3"
    echo ""
    echo "--------------------"
done
