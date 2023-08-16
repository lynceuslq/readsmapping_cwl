#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)


htseq.summarise <- cwlProcess(baseCommand = "htseq-count",
		                    #   arguments=list(c("-f", "bam")),
		                       inputs = InputParamList(
										   InputParam(id = "order", type = "string",prefix = "-r",  position=1),
										   InputParam(id = "cores", type = "int",prefix = "-n",  position=2),
										   InputParam(id = "MAPQ", type = "int",prefix = "-a",  position=3),
										   InputParam(id = "featuretype", type = "string",prefix = "-t",  position=4),
										   InputParam(id = "mode", type = "string",prefix = "-m",  position=5), 
										   InputParam(id = "strand", type = "string",prefix = "-s",  position=6),
										   InputParam(id = "idattribute", type = "string",prefix = "-i",  position=7),
										   InputParam(id = "inputformat", type = "string",prefix = "-f",  position=8),
										   InputParam(id = "sorbam_file", type = "File",  position=9),
										   InputParam(id = "bai_file", type = "File",  position=10),

										   InputParam(id = "gtf_file", type = "File",  position=11)
											                           ),
		                     outputs = OutputParamList(
							                         OutputParam(id = "htseqfile", type = "File", glob = "*.txt")
							
				     ),
		                     stdout = "SRR12513913_1.trimmed.test.htseq.txt"
)

#sample <- "SRR35127"
htseq.summarise$order <- "name"
htseq.summarise$cores <- 4
htseq.summarise$MAPQ <- 10
htseq.summarise$featuretype <- "gene"
htseq.summarise$mode <- "union"
htseq.summarise$strand <- "yes"
htseq.summarise$idattribute <- "Name"
htseq.summarise$inputformat <- "bam"
htseq.summarise$sorbam_file <- "SRR12513913_1.trimmed.test.sorted.bam"
htseq.summarise$gtf_file <- "../natcom2020/genome.gff3"
htseq.summarise$bai_file <- "SRR12513913_1.trimmed.test.sorted.bai"

writeCWL(htseq.summarise, outdir="/mnt/d/cwlworkdir/workflows")
res <- runCWL(htseq.summarise, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")

res$command
