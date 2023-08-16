cwlVersion: v1.0
class: CommandLineTool
baseCommand: fastqc
inputs:
  qc_outdir:
    type: Directory
    inputBinding:
      position: 3
      prefix: -o
      separate: true
  fq_file1:
    type: File
    inputBinding:
      position: 1
      separate: true
  fq_file2:
    type: File?
    inputBinding:
      position: 2
      separate: true
  threads:
    type: int
    inputBinding:
      position: 4
      prefix: -t
      separate: true
outputs:
  fastqcout:
    type: Directory
    outputBinding:
      glob: '*'
stdout: '*'
