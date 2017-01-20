cwlVersion: v1.0
class: CommandLineTool
baseCommand: sh
inputs:
  command:
    type: File
    doc: Shell script
    inputBinding:
      position: 0
    default:
      class: File
      location: 'idsFordbfetch.sh'
  accessions:
    type: File
    doc: File with proteins' accessions whose sequences are to be retrieved.
    inputBinding:
      position: 1
  numberAccessions:
    type: string
    doc: Maximum number of records to fetch
    inputBinding:
      position: 2
    default: '20'
