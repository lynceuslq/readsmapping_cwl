cwlVersion: v1.0
class: CommandLineTool
baseCommand: samtools
arguments:
- stats
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
outputs:
  statsfile:
    type: File
    outputBinding:
      glob: '*.stats'
stdout: SRR12513913_1.trimmed.test.sorted.stats
