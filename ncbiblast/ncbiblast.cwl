cwlVersion: v1.0
class: CommandLineTool
baseCommand: perl
hints:
  DockerRequirement:
    dockerPull: psafont/ebitools:20170601
inputs:
  command:
    type: File
    doc: Program that uses EBI's NCBI BLAST web interface
    inputBinding:
      position: 0
    default:
      class: File
      location: '/usr/src/ebitools/ncbiblast_lwp.pl'
  email:
    type: string
    doc: Submitter's email.
    inputBinding:
      prefix: --email
    default: 'workbench@ebi.ac.uk'
  program:
    type: string
    doc: Which BLAST program must be used.
    inputBinding:
      prefix: --program
    default: 'blastp'
  database:
    type: string
    doc: Databases to be searched.
    inputBinding:
      prefix: --database
    default: 'uniprotkb_swissprot'
  type:
    type: string
    doc: sequence type
    inputBinding:
      prefix: --stype
    default: 'protein'
  sequence:
    type: string
    doc: Sequence to blast.
    inputBinding:
      prefix: --sequence
    default: 'uniprot:wap_rat'
  outformat:
    type: string
    doc: Format of the output
    inputBinding:
      prefix: --outformat
    default: 'ids'
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
  proteins:
    type: stdout
