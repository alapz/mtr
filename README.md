
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mtr

<!-- badges: start -->
<!-- badges: end -->

mtr stands for “Misc Tools for R” which is my collection of functions
that I have either made or gathered throughout my data science projects.
Most are nothing special, but they solve unique problems I could not
find in other packages (or are slightly tweaked).

## Installation

To install these functions use the pacman lines

``` r
if (!require("pacman")) install.packages("pacman")
pacman::p_load_gh("alapz/mtr")
```

or you can use the devtools lines below.

``` r
devtools::install_github("alapz/mtr")
```

## word_comment

The `word_comment()` helper inserts inline Word comments when you knit an R
Markdown document to a DOCX file.

**R Markdown view**

```
`r word_comment("This is in the comment", "**This is in the document**")`
```

**Word (DOCX) view**

![Word document showing the inline comment](https://i.imgur.com/NWedycT.png)

# resave

This function allows the user to “save” data from their environment. The
issue with the base R function is that it overwrites everything. This
function will only re-write the file you specify, if it is present.

This is very useful when you need results from one script to another

## Example

This is a basic example which shows you how to solve a common problem:

``` r
pacman::p_load(mtr, tidyverse) # load libraries for this example

# 1. Create something
df <- mtcars

# 2. Save it to RData using resave
mtr::resave(df, file = "data/mydata.RData")
```

