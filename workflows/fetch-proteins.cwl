cwlVersion: v1.0
doc: Filter accessions and retrieve their sequences.
class: Workflow

inputs:
  numberAccessions: string?
  accessions:
    type: File

outputs:
  sequences:
    type: File
    outputSource: fetch/sequences

steps:
  format:
    run: '../formathandling/idsFordbfetch.cwl'
    in:
      accessions_file: accessions
    out: [accessions]

  fetch:
    run: '../dbfetch/dbfetch.cwl'
    in:
      accessions: format/accessions
    out: [sequences]
