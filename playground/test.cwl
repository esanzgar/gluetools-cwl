cwlVersion: v1.0
label: Generate phylogenetic tree
doc: Search for similar protein sequences using NCBI BLAST. The 20 top most similar sequences are aligned with Clustal Omega and feed to Simple Phylogeny tool.
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement
  - class: StepInputExpressionRequirement

inputs:
  protein:
      label: UniProt identifier
      doc: Enter a UniProt identifier
      default: uniprot:P01308
      type: string?

outputs:
  sequences:
    label: List of sequences
    doc: Then top sequences
    type: File
    outputSource: sss-msa/sequences

steps:
  sss:
    label: NCBI BLAST
    doc: Sequence similarity search
    run: https://raw.githubusercontent.com/psafont/gluetools-cwl/master/ncbiblast/ncbiblast.cwl
    in:
      sequence: protein
    out: [proteins]

  sss-msa:
    label: Top 20 similar sequences
    doc: Use DbFetch to get the 20 top most similar sequences
    run: https://raw.githubusercontent.com/psafont/gluetools-cwl/master/workflows/fetch-proteins.cwl
    in:
      accessions: sss/proteins
      numberAccessions:
          default: '10'
          # valueFrom: '1'
    out: [sequences]
