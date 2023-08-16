cwlVersion: v1.0
class: CommandLineTool
baseCommand: samtools
arguments:
- index
inputs:
  thread:
    type: int
    inputBinding:
      position: 1
      prefix: -@
      separate: true
  sorbam_file:
    type: File
    inputBinding:
      position: 2
      separate: true
  bai_file:
    type: string
    inputBinding:
      position: 3
      separate: true
outputs:
  baifile:
    type: File
    outputBinding:
      glob: '*.bai'
stdout: SRR12513913_1.trimmed.test.sorted.bai
