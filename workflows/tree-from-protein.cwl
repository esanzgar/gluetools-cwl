cwlVersion: v1.0
doc: Find the phylogeny tree of proteins related to the one that was input
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement

inputs:
  protein: string?

outputs:
  tree:
    type: File
    outputSource: phylogeny/tree

steps:
  sss:
    run: 'https://raw.githubusercontent.com/psafont/gluetools-cwl/0.2.0/ncbiblast/ncbiblast.cwl'
    in:
      sequence: protein
    out: [proteins]

  sss-msa:
    run: 'https://raw.githubusercontent.com/psafont/gluetools-cwl/0.2.0/workflows/fetch-proteins.cwl'
    in:
      accessions: sss/proteins
    out: [sequences]

  msa:
    run: 'https://raw.githubusercontent.com/psafont/gluetools-cwl/0.2.0/clustalo/clustalo.cwl'
    in:
      sequences: sss-msa/sequences
    out: [alignment]

  phylogeny:
    run: 'https://raw.githubusercontent.com/psafont/gluetools-cwl/0.2.0/simple_phylogeny/simple_phylogeny.cwl'
    in:
      alignment: msa/alignment
    out: [tree]
