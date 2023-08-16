cwlVersion: v1.0
class: CommandLineTool
baseCommand: cutadapt
inputs:
  adapter1:
    type: string
    inputBinding:
      position: 1
      prefix: -a
      separate: true
  adapter2:
    type: string?
    inputBinding:
      position: 2
      prefix: -A
      separate: true
  cores:
    type: int
    inputBinding:
      position: 3
      prefix: -j
      separate: true
  min_length:
    type: int
    inputBinding:
      position: 4
      prefix: -m
      separate: true
  outputpath:
    type: string
    inputBinding:
      position: 5
      prefix: -o
      separate: true
  outreport:
    type: string
    inputBinding:
      position: 6
      prefix: --json
      separate: true
  fq_file1:
    type: File
    inputBinding:
      position: 7
      separate: true
  fq_file2:
    type: File?
    inputBinding:
      position: 8
      separate: true
outputs:
  trimoutput:
    type: File
    outputBinding:
      glob: SRR12513913_1.trimmed.fastq.gz
stdout: '*'
