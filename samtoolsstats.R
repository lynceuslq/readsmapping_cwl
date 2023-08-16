#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)


samtools.stats <- cwlProcess(baseCommand = "samtools",
		                       arguments=list("stats"),
		                       inputs = InputParamList(
										   InputParam(id = "thread", type = "int",prefix = "-@",,  position=1),
										   InputParam(id = "sorbam_file", type = "File",  position=2)
											                           ),
		                     outputs = OutputParamList(
							                         OutputParam(id = "statsfile", type = "File", glob = "*.stats")
							
				     ),
		                     stdout = "SRR12513913_1.trimmed.test.sorted.stats"
)

#sample <- "SRR35127"
samtools.stats$thread <- 4
samtools.stats$sorbam_file <- "SRR12513913_1.trimmed.test.sorted.bam"

writeCWL(samtools.stats, outdir="/mnt/d/cwlworkdir/workflows")
res <- runCWL(samtools.stats, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
