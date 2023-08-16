#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)


samtools.index <- cwlProcess(baseCommand = "samtools",
		                       arguments=list("index"),
		                       inputs = InputParamList(
										   InputParam(id = "thread", type = "int",prefix = "-@",,  position=1),
										   InputParam(id = "sorbam_file", type = "File",  position=2),
										   InputParam(id = "bai_file", type = "string",  position=3)
											                           ),
		                     outputs = OutputParamList(
							                         OutputParam(id = "baifile", type = "File", glob = "*.bai")
							
				     ),
		                     stdout = "SRR12513913_1.trimmed.test.sorted.bai"
)

#sample <- "SRR35127"
samtools.index$thread <- 4
samtools.index$sorbam_file <- "SRR12513913_1.trimmed.test.sorted.bam"
samtools.index$bai_file <-  "SRR12513913_1.trimmed.test.sorted.bai"

writeCWL(samtools.index, outdir="/mnt/d/cwlworkdir/workflows")
res <- runCWL(samtools.index, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
