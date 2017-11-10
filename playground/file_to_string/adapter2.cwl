#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: ExpressionTool

requirements: { InlineJavascriptRequirement: {} }

inputs:
  file:
    type: File
    inputBinding:
      loadContents: true

expression: |
  ${ return { "content": inputs.file.contents }; }

outputs:
  content: string
