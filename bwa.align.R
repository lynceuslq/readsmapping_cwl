#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)


bwa.align <- cwlProcess(baseCommand = "bwa",
		                       arguments=list("mem"),
		                       inputs = InputParamList(
							                           InputParam(id = "align_thread", type = "int", prefix = "-t", position=1),
										   InputParam(id = "index_prefix", type = "string",  position=2),
										   InputParam(id = "fastq_file1", type = "File",  position=3),
										   InputParam(id = "fastq_file2", type = "File?",  position=4)
											                           ),
		                     outputs = OutputParamList(
							                         OutputParam(id = "alignments", type = "File", glob = "*.sam")
							
				     ),
		                     stdout = "SRR12513913_1.trimmed.test.sam"
)

#sample <- "SRR35127"
bwa.align$align_thread <- 4
bwa.align$index_prefix <- "/mnt/d/cwlworkdir/index/index" 
bwa.align$fastq_file1 <-  "SRR12513913_1.trimmed.test.fastq.gz"

writeCWL(bwa.align, outdir="/mnt/d/cwlworkdir/workflows")
res <- runCWL(bwa.align, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
