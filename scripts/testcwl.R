#!usr/bin/Rscript

library(Rcwl)
library(RcwlPipelines)

ofile <- "temp.txt"
grep_input1 <- InputParam(id = "pattern", type = "string", prefix = "-e", position=1)
#grep_input2 <- InputParam(id = "count", type = "flag", prefix = "-c", position=3)
grep_input3 <- InputParam(id = "input_file", type = "File", position=2)
o1 <- OutputParam(id = "grepfile", type = "File", glob = ofile)

grep1 <- cwlProcess(baseCommand = "grep",
		                    #  arguments=list("-c"),
		                      inputs = InputParamList(grep_input1,grep_input3),
				                        outputs = OutputParamList(o1),
				                        stdout = ofile)


#cut
ofile="cut.txt"
cut_input1 <- InputParam(id = "field", type = "int", prefix = "-f", position=1)
cut_input2 <- InputParam(id = "cut_inputfile", type = "File", position=2)
o2 <- OutputParam(id = "cutfile", type = "File", glob = ofile)

cut1 <- cwlProcess(baseCommand = "cut",
		                   #  arguments=list("-c"),
		                     inputs = InputParamList(cut_input1,cut_input2),
				                     outputs = OutputParamList(o2),
				                     stdout = ofile)


#unique
ofile="uniqcount.txt"
uniq_input1 <- InputParam(id = "uniq_inputfile", type = "File", position=2)
o3 <- OutputParam(id = "uniqfile", type = "File", glob = ofile)

uniq1 <- cwlProcess(baseCommand = "uniq",
		                      arguments=list("-c"),
				                        inputs = InputParamList(uniq_input1),
				                        outputs = OutputParamList(o3),
							                stdout = ofile)


#steps
i1 <- InputParam(id = "cwl_infile", type = "File")
i2 <- InputParam(id = "pattern", type = "string", prefix = "-e")
i3 <- InputParam(id = "field", type = "int", prefix = "-f")

step1 <- cwlStep(id="st1",
		                  run=grep1,
				                   In = list(input_file="cwl_infile", pattern="pattern"))

step2 <- cwlStep(id="st2",
		                 run=cut1,
				                 In = list(cut_inputfile="st1/grepfile", field="field"))

step3 <- cwlStep(id="st3",
		                 run=uniq1,
				                 In = list(uniq_inputfile="st2/cutfile"))

o1 <- OutputParam(id = "unique_count", type = "File",
		                    outputSource = "st3/uniqfile")

cwl <- cwlWorkflow(inputs = InputParamList(i1,i2,i3),
		                       outputs = OutputParamList(o1))

cwl <- cwl + step1 + step2 + step3

cwl$cwl_infile <- "blastn.re.sc.tsv"
cwl$pattern <- "pT7"
cwl$field <- 6

res <- runCWL(cwl, cwlRunner="/root/miniconda3/envs/cwlenv/bin/cwltool")
