# European Bioinformatics Institute (EMBL-EBI), Web Production
cwlVersion: v1.0
class: CommandLineTool
baseCommand: clustalo_lwp.pl
hints:
  DockerRequirement:
    dockerPull: ebiwp/ebitools-container

inputs:

  email:
    type: string
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
    default: sp:wap_rat,sp:wap_mouse

  title:
    type: string
    inputBinding:
      position: 4
      prefix: --title
#    default: '$defaultValue'

  guidetreeout:
    type: boolean
    inputBinding:
      position: 5
      prefix: --guidetreeout
#    default: '$defaultValue'

  dismatout:
    type: boolean
    inputBinding:
      position: 6
      prefix: --dismatout
#    default: '$defaultValue'

  dealign:
    type: boolean
    inputBinding:
      position: 7
      prefix: --dealign
#    default: '$defaultValue'

  mbed:
    type: boolean
    inputBinding:
      position: 8
      prefix: --mbed
#    default: '$defaultValue'

  mbediteration:
    type: boolean
    inputBinding:
      position: 9
      prefix: --mbediteration
#    default: '$defaultValue'

  iterations:
    type: int
    inputBinding:
      position: 10
      prefix: --iterations
#    default: '$defaultValue'

  gtiterations:
    type: int
    inputBinding:
      position: 11
      prefix: --gtiterations
#    default: '$defaultValue'

  hmmiterations:
    type: int
    inputBinding:
      position: 12
      prefix: --hmmiterations
#    default: '$defaultValue'

  outfmt:
    type: string
    inputBinding:
      position: 13
      prefix: --outfmt
#    default: '$defaultValue'

  stype:
    type: string
    inputBinding:
      position: 15
      prefix: --stype
#    default: '$defaultValue'


outputs:
  cwl_out:
    type: File[]
    streamable: true
    outputBinding:
      glob: "*.*"
