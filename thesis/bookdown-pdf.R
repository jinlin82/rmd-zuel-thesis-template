rmdfiles <- as.list(grep(dir(), pattern="[0-9]{2}.*\\.Rmd$",ignore.case = T, value = T))

##################################### purl r codes ######################################
library("knitr")
# New processing functions
process_tangle <- function (x) { 
    UseMethod("process_tangle", x)
}

process_tangle.block <- function (x) {
    params = opts_chunk$merge(x$params)

    # Suppress any code but python
    if (params$engine != 'R') {
        params$purl <- FALSE
    }
    if (isFALSE(params$purl)) 
        return("")
    label = params$label
    ev = params$eval
    code = if (!isFALSE(ev) && !is.null(params$child)) {
               cmds = lapply(sc_split(params$child), knit_child)
               one_string(unlist(cmds))
           }
           else knit_code$get(label)
    if (!isFALSE(ev) && length(code) && any(grepl("read_chunk\\(.+\\)", 
                                                  code))) {
        eval(parse_only(unlist(stringr::str_extract_all(code, 
                                                        "read_chunk\\(([^)]+)\\)"))))
    }
    code = knitr:::parse_chunk(code)
    if (isFALSE(ev)) 
        code = knitr:::comment_out(code, params$comment, newline = FALSE)
                                        # Output only the code, no documentation
    return(knitr:::one_string(code))
}

# Reassign functions
utils::assignInNamespace("process_tangle.block",
                             process_tangle.block,
                             ns="knitr")
    
lapply(rmdfiles, function(x) knitr::purl(input=x, output=paste("./codes/", substr(x, 1,nchar(x)-4), ".R", sep=""), encoding="utf-8"))

##################################### purl python codes ########################################
# New processing functions
process_tangle <- function (x) { 
    UseMethod("process_tangle", x)
}

process_tangle.block <- function (x) {
    params = opts_chunk$merge(x$params)

    # Suppress any code but python
    if (params$engine != 'python') {
        params$purl <- FALSE
    }
    if (isFALSE(params$purl)) 
        return("")
    label = params$label
    ev = params$eval
    code = if (!isFALSE(ev) && !is.null(params$child)) {
               cmds = lapply(sc_split(params$child), knit_child)
               one_string(unlist(cmds))
           }
           else knit_code$get(label)
    if (!isFALSE(ev) && length(code) && any(grepl("read_chunk\\(.+\\)", 
                                                  code))) {
        eval(parse_only(unlist(stringr::str_extract_all(code, 
                                                        "read_chunk\\(([^)]+)\\)"))))
    }
    code = knitr:::parse_chunk(code)
    if (isFALSE(ev)) 
        code = knitr:::comment_out(code, params$comment, newline = FALSE)
                                        # Output only the code, no documentation
    return(knitr:::one_string(code))
}

# Reassign functions
    utils::assignInNamespace("process_tangle.block",
                             process_tangle.block,
                             ns="knitr")
    
lapply(rmdfiles, function(x) knitr::purl(input=x, output=paste("./codes/", substr(x, 1,nchar(x)-4), ".py", sep=""), encoding="utf-8"))


knitr::knit("_data.rmd", output = "./misc/data.tex")
rmarkdown::render_site(output_format = 'bookdown::pdf_book', encoding = 'UTF-8')
