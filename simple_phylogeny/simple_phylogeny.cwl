cwlVersion: v1.0
class: CommandLineTool
baseCommand: perl
inputs:
  command:
    type: File
    doc: Program that uses EBI's ClustalW2 Phylogeny's web interface
    inputBinding:
      position: 0
    default:
      class: File
      location: 'simple_phylogeny_lwp.pl'
  email:
    type: string
    doc: Submitter's email.
    inputBinding:
      prefix: --email
    default: 'workbench@ebi.ac.uk'
  alignment:
    type: File
    doc: Alignment to tree.
    inputBinding:
      prefix: --sequence
    default:
      class: File
      location: 'wap_rat_msa.clustal'
  outformat:
    type: string
    doc: Format of the output
    inputBinding:
      prefix: --outformat
    default: 'tree'
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
