#!/bin/bash

query=${1// /+}

URL="https://www.ebi.ac.uk/europepmc/webservices/rest/search?format=json&resultType=idlist&query=${query}"

curl -s "${URL}"
