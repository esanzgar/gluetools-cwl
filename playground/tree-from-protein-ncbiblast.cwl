cwlVersion: v1.0
label: Generate phylogenetic tree
doc: Search for similar protein sequences using NCBI BLAST. The 20 top most similar sequences are aligned with Clustal Omega and feed to Simple Phylogeny tool.
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement

inputs:
  protein:
      label: UniProt identifier
      doc: Enter a UniProt identifier
      default: uniprot:wap_rat
      type: string?

outputs:
  tree:
    label: Phylogenetic tree
    doc: Newick format phylogenetic tree
    type: File
    outputSource: phylogeny/tree

steps:
  sss:
    label: NCBI BLAST
    doc: Sequence similarity search
    run: './webprod_ncbiblast/ncbiblast.cwl'
    in:
      sequence: protein
#    out: [cwl_out]
    out: [ids]

#  adaptor:
#    label: My adaptor
#    doc: Sequence similarity search
#    run: './webprod_ncbiblast/adaptor.cwl'
#    in:
#      files: sss/cwl_out
#    out: [ids]

  sss-msa:
    label: Top 20 similar sequences
    doc: Use DbFetch to get the 20 top most similar sequences
    run: 'https://raw.githubusercontent.com/esanzgar/gluetools-cwl/master/workflows/fetch-proteins.cwl'
    in:
#      accessions: adaptor/ids
      accessions: sss/ids
    out: [sequences]

  msa:
    label: Clustal Omega
    doc: Multiple sequence alignment
    run: 'https://raw.githubusercontent.com/esanzgar/gluetools-cwl/master/clustalo/clustalo.cwl'
    in:
      sequences: sss-msa/sequences
    out: [alignment]

  phylogeny:
    label: Simple Phylogeny
    doc: Generate phylogeny tree
    run: 'https://raw.githubusercontent.com/esanzgar/gluetools-cwl/master/simple_phylogeny/simple_phylogeny.cwl'
    in:
      alignment: msa/alignment
    out: [tree]
