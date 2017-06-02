cwlVersion: v1.0
class: CommandLineTool
baseCommand: perl
hints:
  DockerRequirement:
    dockerPull: psafont/ebitools:20170601
inputs:
  command:
    type: File
    doc: Wrapper around dbfetch_lwp.pl
    inputBinding:
      position: 0
    default:
      class: File
      location: 'file:///usr/src/ebitools/dbfetch_lwp.pl'
  method:
    type: string
    doc: Type of command-line interface.
    inputBinding:
      position: 1
    default: 'fetchBatch'
  database:
    type: string
    doc: Database to be searched.
    inputBinding:
      position: 2
    default: 'uniprot'
  accessions:
    type: File
    doc: List of proteins' accessions so its sequences can be retrieved.
    inputBinding:
      loadContents: true
      valueFrom: $(self.contents)
      position: 3
  outformat:
    type: string
    doc: Format of the output
    inputBinding:
      position: 4
    default: 'fasta'
  outstyle:
    type: string
    doc: Style of the output
    inputBinding:
      position: 5
    default: 'raw'

outputs:
  sequences:
    type: stdout
