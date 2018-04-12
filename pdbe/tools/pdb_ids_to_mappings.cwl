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
      location: 'pdb_ids_to_mappings.sh'

  file_pdb_ids:
    type: File?
    doc: List of PDB identifiers (either comma separated or one in each line)
    inputBinding:
      position: 1

  pdb_id:
    type: string?
    doc: PDB identifier
    inputBinding:
      position: 1

outputs:
  alignment:
    type: stdout
