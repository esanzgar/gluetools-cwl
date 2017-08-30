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
    run: '../ncbiblast/ncbiblast.cwl'
    in:
      sequence: protein
    out: [proteins]

  sss-msa:
    run: 'fetch-proteins.cwl'
    in:
      accessions: sss/proteins
    out: [sequences]

  msa:
    run: '../clustalo/clustalo.cwl'
    in:
      sequences: sss-msa/sequences
    out: [alignment]

  phylogeny:
    run: '../simple_phylogeny/simple_phylogeny.cwl'
    in:
      alignment: msa/alignment
    out: [tree]
