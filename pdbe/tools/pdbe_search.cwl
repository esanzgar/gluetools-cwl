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
      location: 'pdbe_search.sh'

  query:
    type: string[]
    doc: Search terms
    inputBinding:
      itemSeparator: " OR "

outputs:
  url_results:
    type: stdout
