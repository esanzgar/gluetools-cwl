cwlVersion: v1.0
class: CommandLineTool
baseCommand: perl
inputs:
  command:
    type: File
    doc: Program that uses EBI's database fetch web interface
    inputBinding:
      position: 0
    default:
      class: File
      location: 'dbfetch_lwp.pl'
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
  sequences:
    type: string
    doc: Sequences to fetch.
    inputBinding:
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
  result:
    type: stdout
