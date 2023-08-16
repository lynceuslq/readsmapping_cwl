#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)


samtools.view <- cwlProcess(baseCommand = "samtools",
		                       arguments=list("view"),
		                       inputs = InputParamList(
							                           InputParam(id = "read_quality", type = "int", prefix = "-q", position=1),
										   InputParam(id = "bam_output", type = "boolean",prefix = "-b",  position=2),
										   InputParam(id = "flagged_read", type = "int",prefix = "-f",  position=3),
										   InputParam(id = "auto_detect", type = "boolean",prefix = "-S",,  position=4),
										   InputParam(id = "thread", type = "int",prefix = "-@",,  position=5),
										   InputParam(id = "sam_file", type = "File",  position=6)
											                           ),
		                     outputs = OutputParamList(
							                         OutputParam(id = "bamfile", type = "File", glob = "*.bam")
							
				     ),
		                     stdout = "SRR12513913_1.trimmed.test.bam"
)

#sample <- "SRR35127"
samtools.view$thread <- 4
samtools.view$read_quality <- 0
samtools.view$sam_file <-  "SRR12513913_1.trimmed.test.sam"
samtools.view$flagged_read <- 0
samtools.view$bam_output <- T
samtools.view$auto_detect <- T

writeCWL(samtools.view, outdir="/mnt/d/cwlworkdir/workflows")
res <- runCWL(samtools.view, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
