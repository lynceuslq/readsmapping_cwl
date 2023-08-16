cwlVersion: v1.0
class: CommandLineTool
baseCommand: samtools
arguments:
- sort
inputs:
  by_name:
    type: boolean
    inputBinding:
      position: 1
      prefix: -n
      separate: true
  thread:
    type: int
    inputBinding:
      position: 2
      prefix: -@
      separate: true
  bam_file:
    type: File
    inputBinding:
      position: 3
      separate: true
outputs:
  sorbamfile:
    type: File
    outputBinding:
      glob: '*.bam'
stdout: SRR12513913_1.trimmed.test.sorted.bam
