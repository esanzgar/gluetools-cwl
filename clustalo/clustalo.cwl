cwlVersion: v1.0
class: CommandLineTool
baseCommand: perl
inputs:
  command:
    type: File
    doc: Program that uses EBI's Clustal Omega web interface
    inputBinding:
      position: 0
    default:
      class: File
      location: 'clustalo_lwp.pl'
  email:
    type: string
    doc: Submitter's email.
    inputBinding:
      prefix: --email
    default: 'workbench@ebi.ac.uk'
  outformat:
    type: string
    doc: Format of the output
    inputBinding:
      prefix: --outformat
    default: 'aln-clustal'
  outfile:
    type: string
    doc: Output file, use stdout by default.
    inputBinding:
      prefix: --outfile
    default: '-'
  sequence:
    type: File
    format: http://edamontology.org/format_1929 # FASTA
    doc: Sequences to alineate.
    inputBinding:
      prefix: --sequence
    default:
      class: File
      location: 'wap_rat_sss.fasta'
  quiet:
    type: boolean
    doc: whether info about the running process should be printed or not
    inputBinding:
      prefix: --quiet
    default: true

outputs:
  result:
    type: stdout
