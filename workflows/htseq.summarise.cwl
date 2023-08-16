cwlVersion: v1.0
class: CommandLineTool
baseCommand: htseq-count
inputs:
  order:
    type: string
    inputBinding:
      position: 1
      prefix: -r
      separate: true
  cores:
    type: int
    inputBinding:
      position: 2
      prefix: -n
      separate: true
  MAPQ:
    type: int
    inputBinding:
      position: 3
      prefix: -a
      separate: true
  featuretype:
    type: string
    inputBinding:
      position: 4
      prefix: -t
      separate: true
  mode:
    type: string
    inputBinding:
      position: 5
      prefix: -m
      separate: true
  strand:
    type: string
    inputBinding:
      position: 6
      prefix: -s
      separate: true
  idattribute:
    type: string
    inputBinding:
      position: 7
      prefix: -i
      separate: true
  inputformat:
    type: string
    inputBinding:
      position: 8
      prefix: -f
      separate: true
  sorbam_file:
    type: File
    inputBinding:
      position: 9
      separate: true
  bai_file:
    type: File
    inputBinding:
      position: 10
      separate: true
  gtf_file:
    type: File
    inputBinding:
      position: 11
      separate: true
outputs:
  htseqfile:
    type: File
    outputBinding:
      glob: '*.txt'
stdout: SRR12513913_1.trimmed.test.htseq.txt
