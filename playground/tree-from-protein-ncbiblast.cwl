cwlVersion: v1.0
label: Generate phylogenetic tree
doc: Search for similar protein sequences using NCBI BLAST. The 20 top most similar sequences are aligned with Clustal Omega and feed to Simple Phylogeny tool.
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement

inputs:
  protein:
      type: File
      default: 
        class: File
        #path: https://raw.githubusercontent.com/esanzgar/gluetools-cwl/master/playground/P01308.fasta
        #path: https://oc.ebi.ac.uk/s/yYTcW6n7hJSpMex/download
        path: https://eduardo@ebi.ac.uk:/oc.ebi.ac.uk/remote.php/webdav/P01380.fasta

  email:
      type: string
      default: my@email.com

  program:
      type: string
      default: blastp

  stype:
      type: string
      default: protein

  database:
      type: string
      default: uniprotkb_swissprot

  numberAccessions:
      type: string
      default: '4'

outputs:
  tree:
    label: Phylogenetic tree
    doc: Newick format phylogenetic tree
    type: File
    outputSource: phylogeny/tree

  sss_out:
    type: File[]
    outputSource: sss/cwl_out
# This doesn't work
#    type: File
#    outputBinding:
#        glob: "*.ids.txt"

  msa_out:
    type: File
    outputSource: msa/alignment

steps:
  sss:
    label: NCBI BLAST
    doc: Sequence similarity search
    run: './webprod_ncbiblast/ncbiblast.cwl'
    in:
      sequence_file: protein
      email: email
      database: database
      stype: stype
      program: program
    out: [cwl_out]
#    out: [ids]

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
      numberAccessions: numberAccessions
#      accessions: adaptor/ids
      accessions:
          source: sss/cwl_out
          valueFrom: |
            $( self.filter(file => !!file.basename.match(/^.*\.ids\.txt$/)).pop() )
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
