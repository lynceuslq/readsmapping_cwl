#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)

ofile="SRR12513913_1.trimmed.fastq.gz"
cutadapt.trm <-  cwlProcess(baseCommand = "cutadapt",
			                      inputs = InputParamList(
								                          InputParam(id = "adapter1", type = "string", prefix = "-a", position=1),
											                      InputParam(id = "adapter2", type = "string?", prefix = "-A", position=2),
											                      InputParam(id = "cores", type = "int", prefix = "-j", position=3),
													                          InputParam(id = "min_length", type = "int", prefix = "-m", position=4),
													                          InputParam(id = "outputpath", type = "string", prefix="-o", position=5),
																  InputParam(id = "outreport", type = "string", prefix="--json", position=6),
																  InputParam(id = "fq_file1", type = "File",  position=7),
																  InputParam(id = "fq_file2", type = "File?",  position=8)
																               #       InputParam(id = "reportpath", type = "File", prefix = "2>", position=7)
																                      ),
			                    outputs = OutputParamList(
								                        OutputParam(id = "trimoutput", type =  "File", glob=ofile)
											                ),
			                    stdout = "*")

cutadapt.trm$adapter1 <- "CTGTAGGCACCATCAATATCTCGTATGCCGTCTTCTGCTTG"
#cutadapt.trm$adapter2 <- "tgcagatagaa"
cutadapt.trm$cores <- 6
cutadapt.trm$min_length <- 10
cutadapt.trm$outputpath <- "SRR12513913_1.trimmed.fastq.gz"
cutadapt.trm$outreport <- "SRR12513913_1.trim.report.json"
cutadapt.trm$fq_file1 <- "/mnt/d/rawdata/SRR12513913_1.fastq.gz"
#cutadapt.trm$fq_file2 <- "/mnt/d/rawdata/SRR4427761_2.fastq.gz"

writeCWL(cutadapt.trm, outdir="/mnt/d/cwlworkdir/workflows")

res <- runCWL(cutadapt.trm, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
