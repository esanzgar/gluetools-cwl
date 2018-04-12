cwlVersion: v1.0
doc: Search PDBe and then get sequence
class: Workflow

#hints:
#  DockerRequirement:
#    dockerPull: psafont/ebitools:20170602

inputs:
  term:
    type: string[]
    doc: Search terms
    inputBinding:
      itemSeparator: " OR "

outputs:
  sequences:
    type: File[]
    outputSource: adapter/sequences

steps:
  search:
    run: '../tools/pdbe_search.cwl'
    in:
      query: term
    out: [url_results]

  adapter:
    run: 'json_adapter.cwl'
    in:
      json_file: search/url_results
    out: [sequences]

#  fetch:
#      run: 'https://raw.githubusercontent.com/esanzgar/webservice-cwl/master/docker_cwls/dbfetch.cwl'
#    in:
#      type: fetchBatch
#      dbName: PDB
#      idList: format/accessions
#    out: [sequences]
