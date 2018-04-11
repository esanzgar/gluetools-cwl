cwlVersion: v1.0
class: CommandLineTool
baseCommand: clustalo_lwp.pl
hints:
  DockerRequirement:
    dockerPull: psafont/ebitools:20170602
inputs:
  email:
    type: string
    doc: email of the submitter.
    inputBinding:
      prefix: --email
    default: workbench@ebi.ac.uk
  outformat:
    type: string
    doc: Format of the output
    inputBinding:
      prefix: --outformat
  outfile:
    type: string
    doc: Output file, use stdout by default.
    inputBinding:
      prefix: --outfile
    default: '-'
  sequences:
    type: File
    format: http://edamontology.org/format_1929 # FASTA
    doc: Sequences to alineate.
    inputBinding:
      prefix: --sequence
  quiet:
    type: boolean
    doc: whether info about the running process should be printed or not
    inputBinding:
      prefix: --quiet
    default: true

outputs:
  alignment:
    type: stdout
