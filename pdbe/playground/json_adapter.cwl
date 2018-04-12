cwlVersion: v1.0
class: ExpressionTool

requirements:
    - class: InlineJavascriptRequirement

inputs:
  json_file:
    type: File
    doc: JSON containing URLs

expression: |
  ${ return { inputs } }

outputs:
  sequences:
    type: File[]
