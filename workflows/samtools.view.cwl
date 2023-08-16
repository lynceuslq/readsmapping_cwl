cwlVersion: v1.0
class: CommandLineTool
baseCommand: samtools
arguments:
- view
inputs:
  read_quality:
    type: int
    inputBinding:
      position: 1
      prefix: -q
      separate: true
  bam_output:
    type: boolean
    inputBinding:
      position: 2
      prefix: -b
      separate: true
  flagged_read:
    type: int
    inputBinding:
      position: 3
      prefix: -f
      separate: true
  auto_detect:
    type: boolean
    inputBinding:
      position: 4
      prefix: -S
      separate: true
  thread:
    type: int
    inputBinding:
      position: 5
      prefix: -@
      separate: true
  sam_file:
    type: File
    inputBinding:
      position: 6
      separate: true
outputs:
  bamfile:
    type: File
    outputBinding:
      glob: '*.bam'
stdout: SRR12513913_1.trimmed.test.bam
