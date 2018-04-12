cwlVersion: v1.0
label: Test CWL
doc: Can I parse JSON?
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement

inputs: []

outputs: []

steps:
  sss:
    label: NCBI BLAST
    doc: Sequence similarity search
    run: https://raw.githubusercontent.com/common-workflow-language/cwltool/master/cwltool/schemas/draft-3/draft-3/echo-tool.cwl
    in:
      in:
        default: test
    out: [out]

  sss1:
    label: NCBI BLAST
    doc: Sequence similarity search
    run: https://raw.githubusercontent.com/common-workflow-language/cwltool/master/cwltool/schemas/draft-3/draft-3/echo-tool.cwl
    in:
      in: sss/out
    out: [out]

  sss2:
    label: NCBI BLAST
    doc: Sequence similarity search
    run: https://raw.githubusercontent.com/common-workflow-language/cwltool/master/cwltool/schemas/draft-3/draft-3/echo-tool.cwl
    in:
      in:
        default: chocolate
    out: [out]

  sss3:
    label: NCBI BLAST
    doc: Sequence similarity search
    run: https://raw.githubusercontent.com/common-workflow-language/cwltool/master/cwltool/schemas/draft-3/draft-3/echo-tool.cwl
    in:
      in: sss2/out
    out: [out]
