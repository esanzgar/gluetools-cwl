cwlVersion: v1.0
label: Generate phylogenetic tree
doc: Search for similar protein sequences using NCBI BLAST. The 20 top most similar sequences are aligned with Clustal Omega
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement

inputs:
  protein:
      type: string
      default: uniprot:wap_rat

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

# This doesn't work
  sss_out:
    type: File[]
    outputSource: sss/cwl_out
    outputBinding:
        glob: "*.xml.xml"
        outputEval: |
            $( self[0] )

  sequences:
    type: File
    outputSource: sss-msa/sequences


steps:
  sss:
    label: NCBI BLAST
    doc: Sequence similarity search
    run: 'https://raw.githubusercontent.com/esanzgar/gluetools-cwl/master/playground/webprod_ncbiblast/ncbiblast.cwl'
    in:
      sequence: protein
      email: email
      database: database
      stype: stype
      program: program
    out: [cwl_out]

  sss-msa:
    label: Top 20 similar sequences
    doc: Use DbFetch to get the 20 top most similar sequences
    run: 'https://raw.githubusercontent.com/esanzgar/gluetools-cwl/master/workflows/fetch-proteins.cwl'
    in:
      numberAccessions: numberAccessions
      accessions:
          source: sss/cwl_out
          valueFrom: |
            $( self.filter(file => !!file.basename.match(/^.*\.ids\.txt$/)).pop() )
    out: [sequences]
