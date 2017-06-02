cwlVersion: v1.0
class: CommandLineTool
baseCommand: simple_phylogeny_lwp.pl
hints:
  DockerRequirement:
    dockerPull: psafont/ebitools:20170602
inputs:
  email:
    type: string
    doc: email of the submitter
    inputBinding:
      prefix: --email
    default: workbench@ebi.ac.uk
  alignment:
    type: File
    doc: Alignment to tree.
    inputBinding:
      prefix: --sequence
      position: 1
  outformat:
    type: string
    doc: Format of the output
    inputBinding:
      prefix: --outformat
    default: tree
  outfile:
    type: string
    doc: Output file, use stdout by default.
    inputBinding:
      prefix: --outfile
    default: '-'
  quiet:
    type: boolean
    doc: whether info about the running process should be printed or not
    inputBinding:
      prefix: --quiet
    default: true

outputs:
  tree:
    type: stdout
