#!/bin/bash

URL=http://wwwdev.ebi.ac.uk/chembl/glados-es/chembl_molecule/_search

postData="
{
    \"query\": {
        \"match\": {
            \"_all\": \""$1"\"
        }
    },
    \"_source\": false
}
"

curl -s -d "$postData" $URL
