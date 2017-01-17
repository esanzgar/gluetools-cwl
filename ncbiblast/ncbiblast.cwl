cwlVersion: v1.0
class: CommandLineTool
baseCommand: perl
inputs:
  command:
    type: File
    doc: Program that uses EBI's ncbi blast web interface
    inputBinding:
      position: 0
    default:
      class: File
      location: ncbiblast_lwp.pl
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
  outfile:
    type: string
    doc: use stdout
    inputBinding:
      prefix: --outfile
    default: '-'

outputs:
  result:
    type: stdout
