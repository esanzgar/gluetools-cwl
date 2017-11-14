cwlVersion: v1.0
class: ExpressionTool

requirements: { InlineJavascriptRequirement: {} }

inputs:
  files:
    type: File[]

expression: |
    ${ return {"ids": inputs.files.filter(file => !!file.basename.match(/^.*\.ids\.txt$/)).pop()}; }

outputs:
  ids:
    type: File
