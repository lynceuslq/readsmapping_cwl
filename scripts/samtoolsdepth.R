#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)


samtools.depth <- cwlProcess(baseCommand = "samtools",
		                       arguments=list("depth"),
		                       inputs = InputParamList(
										   InputParam(id = "all_positions", type = "boolean",prefix = "-a",  position=1),
										   InputParam(id = "read_length_beyond", type = "int",prefix = "-l",  position=2),
										   InputParam(id = "max_coverage", type = "int",prefix = "-m",  position=3),
										   InputParam(id = "base_quality", type = "int",prefix = "-q",  position=4),
										   InputParam(id = "map_quality", type = "int",prefix = "-Q",  position=5),
										   InputParam(id = "sorbam_file", type = "File",  position=6)
											                           ),
		                     outputs = OutputParamList(
							                         OutputParam(id = "depfile", type = "File", glob = "*.depth")
							
				     ),
		                     stdout = "SRR12513913_1.trimmed.test.sorted.depth"
)

#sample <- "SRR35127"
samtools.depth$all_positions <- T
samtools.depth$read_length_beyond <- 0
samtools.depth$max_coverage <- 8000
samtools.depth$base_quality <- 0
samtools.depth$map_quality <- 0
samtools.depth$sorbam_file <- "SRR12513913_1.trimmed.test.sorted.bam"

writeCWL(samtools.depth, outdir="/mnt/d/cwlworkdir/workflows")
res <- runCWL(samtools.depth, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
