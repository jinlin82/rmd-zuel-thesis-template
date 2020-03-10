args<-commandArgs(trailingOnly = TRUE)
if(grepl(".rmd", args[1], ignore.case=T)) args[1] <- substr(args[1], 1, nchar(args[1])-4)
if (file.exists(paste(args[1], ".rmd", sep="")))
{rmarkdown::render(input=paste(args[1], ".rmd", sep=""), "bookdown::word_document2",encoding="utf-8")
}else{
rmarkdown::render(input=paste(args[1], ".md", sep=""), "bookdown::word_document2",encoding="utf-8")}
