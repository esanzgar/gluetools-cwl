cwlVersion: v1.0
class: CommandLineTool
baseCommand: cat

stdout: message

inputs:
  file:
    type: File
    doc: File
    inputBinding:
      position: 1

outputs:
  content:
    type: string
    outputBinding:
      glob: message
      loadContents: true
      outputEval: $(self[0].contents)
