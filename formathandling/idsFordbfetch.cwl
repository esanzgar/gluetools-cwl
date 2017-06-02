cwlVersion: v1.0
class: CommandLineTool
baseCommand: sh
hints:
  DockerRequirement:
    dockerPull: psafont/ebitools:20170602
inputs:
  command:
    type: string
    inputBinding:
      position: 0
    default: /usr/src/ebitools/idsFordbfetch.sh
  accessions_file:
    type: File
    doc: File with proteins accessions whose sequences are to be retrieved.
    inputBinding:
      position: 1
  numberAccessions:
    type: string
    doc: Maximum number of records to fetch
    inputBinding:
      position: 2
    default: '20'

outputs:
  accessions:
    type: stdout
