# European Bioinformatics Institute (EMBL-EBI), Web Production
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ncbiblast_lwp.pl
hints:
  DockerRequirement:
    dockerPull: ebiwp/ebitools-container

inputs:

  email:
    type: string?
    doc: Submitter's email.
    inputBinding:
      position: 2
      prefix: --email
    default: 'joonlee@ebi.ac.uk'

  sequence:
    type: string
    inputBinding:
      position: 3
      prefix: --sequence

  program:
    type: string?
    inputBinding:
      position: 8
      prefix: --program
    default: 'blastp'

  stype:
    type: string?
    inputBinding:
      position: 16
      prefix: --stype
    default: 'protein'

  database:
    type: string?
    inputBinding:
      position: 24
      prefix: --database
    default: 'uniprotkb_swissprot'

  title:
    type: string?
    inputBinding:
      position: 28
      prefix: --title
    default: 'My blast'

  matrix:
    type: string?
    inputBinding:
      position: 30
      prefix: --matrix
    default: 'BLOSUM62'

  alignments:
    type: int?
    inputBinding:
      position: 31
      prefix: --alignments
    default: 50

  scores:
    type: int?
    inputBinding:
      position: 32
      prefix: --scores
    default: 50

  exp:
    type: int?
    inputBinding:
      position: 33
      prefix: --exp
    default: 10

  dropoff:
    type: int?
    inputBinding:
      position: 34
      prefix: --dropoff
    default: 0

  gapopen:
    type: int?
    inputBinding:
      position: 36
      prefix: --gapopen
    default: -1

  gapext:
    type: int?
    inputBinding:
      position: 37
      prefix: --gapext
    default: -1

  filter:
    type: string?
    inputBinding:
      position: 38
      prefix: --filter
    default: 'F'

  seqrange:
    type: string?
    inputBinding:
      position: 39
      prefix: --seqrange
    default: 'START-END'

  gapalign:
    type: boolean?
    inputBinding:
      position: 40
      prefix: --gapalign
    default: true

  compstats:
    type: string?
    inputBinding:
      position: 41
      prefix: --compstats
    default: 'F'

  align:
    type: int?
    inputBinding:
      position: 42
      prefix: --align
    default: 0

outputs:
#  cwl_out:
#    type: File[]
#    streamable: true
#    outputBinding:
#      glob: "*"

  complete-visual-jpg:
    type: File
    streamable: true
    outputBinding:
      glob: "*.complete-visual-jpg.jpg"

  complete-visual-png:
    type: File
    streamable: true
    outputBinding:
      glob: "*.complete-visual-png.png"

  complete-visual-svg:
    type: File
    streamable: true
    outputBinding:
      glob: "*.complete-visual-svg.svg"

  ffdp-query-jpg:
    type: File
    streamable: true
    outputBinding:
      glob: "*.ffdp-query-jpeg.jpg"

  ffdp-query-png:
    type: File
    streamable: true
    outputBinding:
      glob: "*.ffdp-query-png.png"

  ffdp-query-svg:
    type: File
    streamable: true
    outputBinding:
      glob: "*.ffdp-query-svg.svg"

  ffdp-subject-jpg:
    type: File
    streamable: true
    outputBinding:
      glob: "*.ffdp-subject-jpeg.jpg"

  ffdp-subject-png:
    type: File
    streamable: true
    outputBinding:
      glob: "*.ffdp-subject-png.png"

  ffdp-subject-svg:
    type: File
    streamable: true
    outputBinding:
      glob: "*.ffdp-subject-svg.svg"

  ids:
    type: File
    streamable: true
    outputBinding:
      glob: "*.ids.txt"

  out:
    type: File
    streamable: true
    outputBinding:
      glob: "*.out.txt"

  sequence-out:
    type: File
    streamable: true
    outputBinding:
      glob: "*.sequence.txt"

  visual-jpg:
    type: File
    streamable: true
    outputBinding:
      glob: "*.visual-jpg.jpg"

  visual-png:
    type: File
    streamable: true
    outputBinding:
      glob: "*.visual-png.png"

  visual-svg:
    type: File
    streamable: true
    outputBinding:
      glob: "*.visual-svg.svg"

  xml:
    type: File
    streamable: true
    outputBinding:
      glob: "*.xml.xml"
