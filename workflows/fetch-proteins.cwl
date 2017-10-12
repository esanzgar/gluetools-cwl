cwlVersion: v1.0
label: Retrieve biological records
doc: Retrieve biological records by accession identifier
class: Workflow

inputs:
  accessions:
    label: File with identifiers
    doc: File with identifiers
    type: File
  numberAccessions:
    label: Number of records to retrieve
    doc: Number of records to retrieve starting from the top.
    type: string?

outputs:
  sequences:
    label: Biological records
    doc: Output file with retrieved biological records
    type: File
    outputSource: fetch/sequences

steps:
  format:
    label: Get X top identifiers
    doc: Filter the X top identiers
    run: '../formathandling/idsFordbfetch.cwl'
    in:
      accessions_file: accessions
      # numberAccessions: numberAccessions
    out: [accessions]

  fetch:
    label: Dbfetch
    doc: Retrieve biological records from identifiers
    run: '../dbfetch/dbfetch.cwl'
    in:
      accessions: format/accessions
    out: [sequences]
