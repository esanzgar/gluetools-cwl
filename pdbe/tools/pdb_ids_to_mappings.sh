#!/bin/bash

URL=http://www.ebi.ac.uk/pdbe/api/mappings

# Bulk requests via POST is not available for SIFTS and nucleic acids calls.
# curl -s --data-binary @"$1" $URL

curl -f -s "${URL}/${1}" > /dev/null && cat <<-END
{
 "all": "${URL}/${1}",
 "uniprot": "${URL}/uniprot/${1}",
 "interpro": "${URL}/interpro/${1}",
 "pfam": "${URL}/pfam/${1}",
 "cath": "${URL}/cath/${1}",
 "scop": "${URL}/scop/${1}",
 "go": "${URL}/go/${1}",
 "ec": "${URL}/ec/${1}",
 "ensembl": "${URL}/ensembl/${1}",
 "sequence_domains": "${URL}/sequence_domains/${1}",
 "structural_domains": "${URL}/structural_domains/${1}"
}
END
