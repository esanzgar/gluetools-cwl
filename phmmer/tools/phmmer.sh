#!/bin/bash

query="\"content\":\"${1//$'\n'/\n}\""
database="\"seqdb\": \"$2\""

URL='https://www.ebi.ac.uk/Tools/hmmer/search/phmmer'

curl -s -L "$URL" -H 'Content-Type: application/json' --data-binary "{ $query, $database }"
