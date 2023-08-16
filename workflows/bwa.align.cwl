cwlVersion: v1.0
class: CommandLineTool
baseCommand: bwa
arguments:
- mem
inputs:
  align_thread:
    type: int
    inputBinding:
      position: 1
      prefix: -t
      separate: true
  index_prefix:
    type: string
    inputBinding:
      position: 2
      separate: true
  fastq_file1:
    type: File
    inputBinding:
      position: 3
      separate: true
  fastq_file2:
    type: File?
    inputBinding:
      position: 4
      separate: true
outputs:
  alignments:
    type: File
    outputBinding:
      glob: '*.sam'
stdout: SRR12513913_1.trimmed.test.sam
