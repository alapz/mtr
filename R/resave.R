#' resave
#'
#' This function will save an RData file, if one does not exists it will create it.
#'
#' @param list List of files from your environment you want to save
#' @param file Name of the RData file you want to save
#'
#' @return
#' @export
#'
resave <- function(..., list = character(), file) {
  #  add objects to existing Rdata file. Original code written by "flodel"
  # on StackOverflow (http://www.linkedin.com/in/florentdelmotte)  .
  if (file.exists(file) == FALSE){
    # if the file doesnt exist create it using the list of files given by the user
    var.names <- c(list, as.character(substitute(list(...)))[-1L])
    for (var in var.names) assign(var, get(var, envir = parent.frame()))
    save(list = unique(c(var.names)), file = file)
    
  } else if (file.exists(file) == TRUE){
    # if the file does exist load it then add user files to the RData file
    previous  <- load(file)
    var.names <- c(list, as.character(substitute(list(...)))[-1L])
    for (var in var.names) assign(var, get(var, envir = parent.frame()))
    save(list = unique(c(previous, var.names)), file = file)
  }
}
