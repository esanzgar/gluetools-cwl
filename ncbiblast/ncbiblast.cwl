cwlVersion: v1.0
class: CommandLineTool
baseCommand: ncbiblast_lwp.pl
hints:
  DockerRequirement:
    dockerPull: psafont/ebitools:20170602
inputs:
  email:
    type: string
    doc: Email of the submitter.
    inputBinding:
      prefix: --email
    default: workbench@ebi.ac.uk
  program:
    type: string
    doc: Which BLAST program must be used.
    inputBinding:
      prefix: --program
    default: blastp
  database:
    type: string
    doc: Databases to be searched.
    inputBinding:
      prefix: --database
    default: uniprotkb_swissprot
  type:
    type: string
    doc: sequence type
    inputBinding:
      prefix: --stype
    default: protein
  sequence:
    type: string?
    doc: Sequence to blast.
    inputBinding:
      prefix: --sequence
    default: uniprot:wap_rat
  outformat:
    type: string
    doc: Format of the output
    inputBinding:
      prefix: --outformat
    default: ids
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
