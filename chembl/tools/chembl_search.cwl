cwlVersion: v1.0
class: CommandLineTool
baseCommand: bash

#hints:
#  DockerRequirement:
#    dockerPull: psafont/ebitools:20170602

inputs:
  command:
    type: File
    inputBinding:
      position: 0
    default:
      class: File
      location: 'chembl_search.sh'

  query:
    type: string[]
    doc: Search terms
    inputBinding:
      itemSeparator: " "

outputs:
  results:
    type: stdout
