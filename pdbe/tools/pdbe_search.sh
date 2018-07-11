#!/bin/bash

query=${1// /+}

URL=https://www.ebi.ac.uk/pdbe/search/pdb/select
ROWS=2147483647

#http "${URL}?q=(${query})&wt=json" > /dev/null && cat <<-END
curl -f -s "${URL}?q=(${query})&wt=json" > /dev/null && cat <<-END
{
 "all": "${URL}?q=(${query})&wt=json&group=true&group.field=pdb_id&fl=pdb_id,entry_authors,title,status",
 "pdb_id": "${URL}?q=(${query})&wt=json&fl=pdb_id&rows=$ROWS&group.field=pdb_id",
 "uniprot_id": "${URL}?q=(${query})&wt=json&fl=uniprot_id&rows=$ROWS&group.field=pdb_id",
 "interacting_ligands": "${URL}?q=(${query})&wt=json&fl=interacting_ligands&rows=$ROWS&group.field=pdb_id"
}
END
