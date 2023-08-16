#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)


fastqc <- cwlProcess(baseCommand = "fastqc",
		                     #  arguments=list("-c"),
		                       inputs = InputParamList(
							                           InputParam(id = "qc_outdir", type = "Directory", prefix = "-o", position=3),
										                       InputParam(id = "fq_file1", type = "File",, position=1),
										   		InputParam(id = "fq_file2", type = "File?",  position=2),
										                       InputParam(id = "threads", type = "int", prefix = "-t", position=4)
											                           ),
		                     outputs = OutputParamList(
							                         OutputParam(id = "fastqcout", type = "Directory", glob = "*")
										                 ),
		                     stdout = "*")

#sample <- "SRR35127"

fastqc$qc_outdir <- "/mnt/d/cwlworkdir/QC"
fastqc$fq_file1 <- "/mnt/d/rawdata/SRR4427761_1.fastq.gz"
#fastqc$fq_file2 <- "/mnt/d/rawdata/SRR4427761_2.fastq.gz"
fastqc$threads <- 8

writeCWL(fastqc, outdir="/mnt/d/cwlworkdir/workflows")
res <- runCWL(fastqc, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
