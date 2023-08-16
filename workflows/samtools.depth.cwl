cwlVersion: v1.0
class: CommandLineTool
baseCommand: samtools
arguments:
- depth
inputs:
  all_positions:
    type: boolean
    inputBinding:
      position: 1
      prefix: -a
      separate: true
  read_length_beyond:
    type: int
    inputBinding:
      position: 2
      prefix: -l
      separate: true
  max_coverage:
    type: int
    inputBinding:
      position: 3
      prefix: -m
      separate: true
  base_quality:
    type: int
    inputBinding:
      position: 4
      prefix: -q
      separate: true
  map_quality:
    type: int
    inputBinding:
      position: 5
      prefix: -Q
      separate: true
  sorbam_file:
    type: File
    inputBinding:
      position: 6
      separate: true
outputs:
  depfile:
    type: File
    outputBinding:
      glob: '*.depth'
stdout: SRR12513913_1.trimmed.test.sorted.depth
