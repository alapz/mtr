#' Convert SPSS numeric date values to `Date`
#'
#' SPSS encodes dates as the number of seconds since 1582-10-14. This helper
#' converts those numeric values into R [Date] objects. See
#' <https://stackoverflow.com/questions/37880975/spss-date-format-when-imported-into-r>.
#'
#' @param x Numeric vector containing SPSS date values (seconds since 1582-10-14).
#'
#' @return A [Date] vector corresponding to `x`.
#' @export
#'
spss2date <- function(x) {
  as.Date(x / 86400, origin = "1582-10-14")
}

#' Reorder data frame columns
#'
#' Move one or more columns in a data frame relative to another column without
#' retyping the full column order. Adapted from
#' <https://stackoverflow.com/questions/3369959/moving-columns-within-a-data-frame-without-retyping>.
#'
#' @param df A data frame.
#' @param move_this Character vector of column names to move.
#' @param next_to_this Name of the column that `move_this` should be moved
#'   before or after.
#' @param before Logical indicating whether `move_this` should be placed before
#'   (`TRUE`) or after (`FALSE`, the default) `next_to_this`.
#'
#' @return A data frame with columns reordered.
#' @export
#'
move.col <- function(df, move_this, next_to_this, before = FALSE) {
  if (before == FALSE) {
    df[
      , c(
        match(setdiff(names(df)[1:which(names(df) == next_to_this)], move_this), names(df)),
        match(move_this, names(df)),
        match(
          setdiff(
            names(df)[which(names(df) == next_to_this):ncol(df)],
            c(next_to_this, move_this)
          ),
          names(df)
        )
      )
    ]
  } else {
    df[
      , c(
        match(
          setdiff(
            names(df)[1:(which(names(df) == next_to_this))],
            c(next_to_this, move_this)
          ),
          names(df)
        ),
        match(move_this, names(df)),
        match(
          setdiff(
            names(df)[(which(names(df) == next_to_this)):ncol(df)],
            move_this
          ),
          names(df)
        )
      )
    ]
  }
}

# ▬ clear.labels ------
#' clear.labels
#'
#' clears labels from your df   # src: https://stackoverflow.com/questions/2394902/remove-variable-labels-attached-with-foreign-hmisc-spss-import-functions
#'
#' @param list List of files from your environment you want to save
#' @param file Name of the RData file you want to save
#'
#' @return
#' @export
#'

# src: https://stackoverflow.com/questions/2394902/remove-variable-labels-attached-with-foreign-hmisc-spss-import-functions
clear.labels <- function(x) {
  if(is.list(x)) {
    for(i in seq_along(x)) {
      class(x[[i]]) <- setdiff(class(x[[i]]), 'labelled')
      attr(x[[i]],"label") <- NULL
    }
  } else {
    class(x) <- setdiff(class(x), "labelled")
    attr(x, "label") <- NULL
  }
  return(x)
}

# my_rowmeans ----------
#' my_rowmeans
#'
#' take row means. Used in A-CAP project
#'
#' @param list List of files from your environment you want to save
#' @param file Name of the RData file you want to save
#'
#' @return
#' @export
#'
my_rowmeans = function(...) Reduce(`+`, list(...))/length(list(...))


# ▬ say_something -----
#' say_something
#'
#' Used to tap into Windows text-to-speech. Will only work on Windows-based machines.
#'
#' @param list List of files from your environment you want to save
#' @param file Name of the RData file you want to save
#'
#' @return
#' @export
#'
say_something <- function(message , voice) {

  voice <- paste0("\"$speak.SelectVoice('Microsoft ", voice, " Desktop');" )
  message <- paste0("$speak.Speak('", message, "');\"")

  system2(command = "PowerShell",
          args = c("-Command",
                   "\"Add-Type -AssemblyName System.Speech;",
                   "$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer;",
                   voice,
                   message
          ))
}

#' !in
#'
#' This function does not currently work. Negate the %in% function
#'
#' @param list List of files from your environment you want to save
#' @param file Name of the RData file you want to save
#'
#' @return
#' @export
#'
`%!in%` = Negate(`%in%`)

# ▬ roundme -----
#' siground
#'
#' Will only apply signif to the fractional part of the number. Original found function on SO here: https://stackoverflow.com/questions/71736040/signif-doesnt-give-me-the-correct-number-of-significant-digits-in-r
#'
#' @param list columns you want to edit
#' @param file Name of the RData file you want to save
#'
#' @return
#' @export
#'
siground <- function(x, digits = 3) {
  x %/% 1 + signif(x %% 1, digits)
} 
