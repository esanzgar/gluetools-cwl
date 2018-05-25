cwlVersion: v1.0
class: CommandLineTool
baseCommand: bash

#hints:
#  DockerRequirement:
#    dockerPull: psafont/ebitools:20170602

inputs:
  command:
    type: File
    inputBinding:
      position: 0
    default:
      class: File
      location: 'phmmer.sh'

  sequence:
    type: string
    doc: Sequence
    inputBinding:
      position: 1

  database:
    type: string
    doc: Database
    inputBinding:
      position: 2

  input-file:
    type: File?
    inputBinding:
      position: 3

outputs:
  results:
    type: stdout
