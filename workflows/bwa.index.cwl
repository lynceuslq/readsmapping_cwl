cwlVersion: v1.0
class: CommandLineTool
baseCommand: bwa
arguments:
- index
inputs:
  index_dir:
    type: string
    inputBinding:
      position: 1
      prefix: -p
      separate: true
  index_blocksize:
    type: int
    inputBinding:
      position: 2
      prefix: -b
      separate: true
  genome:
    type: File
    inputBinding:
      position: 3
      separate: true
outputs:
  indexout:
    type: Directory
    outputBinding:
      glob: '*'
