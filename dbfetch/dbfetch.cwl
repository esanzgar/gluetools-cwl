cwlVersion: v1.0
class: CommandLineTool
baseCommand: sh
inputs:
  command:
    type: File
    doc: Wrapper around dbfetch_lwp.pl
    inputBinding:
      position: 0
    default:
      class: File
      location: 'dbfetch.sh'
  accessions:
    type: File
    doc: File with list of proteins' accessions so its sequences can be retrieved.
    inputBinding:
      position: 1
  numberAccessions:
    type: string
    doc: Maximum number of records to fetch
    inputBinding:
      position: 2
    default: '20'
  perl:
    type: File
    doc: Program that uses EBI's database fetch web interface
    inputBinding:
      position: 3
    default:
      class: File
      location: 'dbfetch_lwp.pl'
  method:
    type: string
    doc: Type of command-line interface.
    inputBinding:
      position: 4
    default: 'fetchBatch'
  database:
    type: string
    doc: Database to be searched.
    inputBinding:
      position: 5
    default: 'uniprot'
  outformat:
    type: string
    doc: Format of the output
    inputBinding:
      position: 6
    default: 'fasta'
  outstyle:
    type: string
    doc: Style of the output
    inputBinding:
      position: 7
    default: 'raw'

outputs:
  sequences:
    type: stdout
