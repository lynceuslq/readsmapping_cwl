#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)


samtools.sort <- cwlProcess(baseCommand = "samtools",
		                       arguments=list("sort"),
		                       inputs = InputParamList(
										   InputParam(id = "by_name", type = "boolean",prefix = "-n",  position=1),
										   InputParam(id = "thread", type = "int",prefix = "-@",,  position=2),
										   InputParam(id = "bam_file", type = "File",  position=3)
											                           ),
		                     outputs = OutputParamList(
							                         OutputParam(id = "sorbamfile", type = "File", glob = "*.bam")
							
				     ),
		                     stdout = "SRR12513913_1.trimmed.test.sorted.bam"
)

#sample <- "SRR35127"
samtools.sort$thread <- 4
samtools.sort$by_name <- F
samtools.sort$bam_file <- "SRR12513913_1.trimmed.test.bam"

writeCWL(samtools.sort, outdir="/mnt/d/cwlworkdir/workflows")
res <- runCWL(samtools.sort, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
