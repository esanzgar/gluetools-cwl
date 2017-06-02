cwlVersion: v1.0
class: CommandLineTool
baseCommand: dbfetch_lwp.pl
hints:
  DockerRequirement:
    dockerPull: psafont/ebitools:20170602
inputs:
  method:
    type: string
    doc: Type of command-line interface.
    inputBinding:
      position: 1
    default: fetchBatch
  database:
    type: string
    doc: Database to be searched.
    inputBinding:
      position: 2
    default: uniprot
  accessions:
    type: File
    doc: List of accessions to be retrieved as sequences.
    inputBinding:
      loadContents: true
      valueFrom: $(self.contents)
      position: 3
  outformat:
    type: string
    doc: Format of the output
    inputBinding:
      position: 4
    default: fasta
  outstyle:
    type: string
    doc: Style of the output
    inputBinding:
      position: 5
    default: raw

outputs:
  sequences:
    type: stdout
