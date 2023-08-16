#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)


bwa.index <- cwlProcess(baseCommand = "bwa",
		                       arguments=list("index"),
		                       inputs = InputParamList(
							                           InputParam(id = "index_dir", type = "string", prefix = "-p", position=1),
										   InputParam(id = "index_blocksize", type = "int", prefix = "-b",  position=2),
										   InputParam(id = "genome", type = "File",  position=3)
											                           ),
		                     outputs = OutputParamList(
							                         OutputParam(id = "indexout", type = "Directory", glob = "*")
										                 ),
		                    # stdout = "log.txt"
)

#sample <- "SRR35127"
bwa.index$index_dir <- "/mnt/d/cwlworkdir/index/index"
bwa.index$index_blocksize <- 10000000
bwa.index$genome <- "/mnt/d/natcom2020/genome.fasta"

writeCWL(bwa.index, outdir="/mnt/d/cwlworkdir/workflows")
res <- runCWL(bwa.index, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
