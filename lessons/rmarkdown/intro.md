---
title: "Introduction: Report generation using R Markdown"
published: true
author:
    - Luke W. Johnston
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Introduction
    - Rmarkdown
    - R
categories:
    - Lessons
    - Rmarkdown
    - R
permalink: lessons/rmarkdown/
output:
    html_document:
        toc: true
    md_document:
        variant: markdown_github
        toc: true
---

A recent feature to using R is the incredibly powerful and incredibly useful
package [`rmarkdown`](http://rmarkdown.rstudio.com/) (and by extension the
package [`knitr`](http://yihui.name/knitr/)). R Markdown allows you to
dynamically generate a report (could be a manuscript or your thesis!) where R
automatically inserts tables, figures, numbers, and citations into your document
so that you never again have to copy and paste anything! You can create Word,
HTML, or PDF files from your `.Rmd` (or R Markdown) file, letting you
collaborate with the least tech-savvy individuals. It also dramatically cuts
down on your time writing your manuscript or thesis because as you write it up
you are also putting in the R code to create everything that will be in the
report.  In one step you go for analysis to report! No more worries about fixing
up your report after a co-author suggests to re-do a part of the analysis!

# Learning objectives:

1. Write in markdown
2. Use YAML and R code chunk options
3. Create tables and figures
4. Ultimately, generate a dynamic report in either Word or HTML.

# Materials for this lesson:

* [Slides](slides/)
* [Cheatsheet](cheatsheet/)
* [Assignment](assignment/)

More resources on R Markdown can be found [here](../resources/).

# Generating a dynamic report!

## YAML metadata

This is the part that tells R how to generate the document. 
[YAML](https://en.wikipedia.org/wiki/YAML) is a human-readable data-encoding
format. What that means is it makes it so you can easily type up commands that
both you and the computer will understand. A typical YAML metadata looks like:

```
---
title: "Introducing R Markdown"
published: false
author: "Luke Johnston"
date: "July 23, 2015"
output: html_document
---
```

Note the starting and ending `---` 'tags', which tell R that this is a YAML
block.

## Markdown syntax

Markdown is called a 'markup language' that allows you to convert to a vast
number of file formats (html, word, pdf, etc). It's a 'language' because you use
specific characters or symbols to represent something else in another file
format after conversion.  For instance, see below:

```
# This is a header

## This is a second-level header

Let's show some **bolding** and *italics*. Or why not show a link to [Google](http://google.ca). Some times you may need to show `code` snippets. Or a code block, either using tab or three backticks (```):

    code <- here
    
Sometimes we need a list:

- Item 1
- Item 2

Or a numbered list:

1. Item 1
2. Item 2

This is a citation @Joe2005 (not converted). Or an image (not converted):

![Caption text](path/to/image)

```

## R Markdown

R Markdown is Markdown and R combined! So you get the simplicity of Markdown
with the power of R! Within the R Markdown document, you can insert R code
chunks to input and create the output into the document. They look like this:

    
    ```r
    testCode <- 1:10
    print(testCode)
    ##  [1]  1  2  3  4  5  6  7  8  9 10
    ```

You'll notice that the code chunk printed off 1 to 10 and put it into the
document. I didn't do that, R did it for me!

The code chunks have several options that allow you to customize how you want R
to treat the chunk. Most options require either a `TRUE` or `FALSE` as the
setting. Two commonly used options include:

- `eval`: Whether or not R runs the code chunk
- `echo`: Whether the code chunk is kept in the converted format (eg. Word or
HTML)

There are also options `message`, `warning`, `error`.

You can also include inline R code snippets that pastes the output directly into
the paragraph. Use the markdown syntax for inline code, except with an r
infront like ` testing `, which creates testing.

## Creating tables using R code

Within Markdown is the ability to create tables the convert into the other
document formats, such as Word or HTML. Using the `pander()` command from the 
`pander` package, you can create these Markdown tables of an R object. In
addition to the `pander()` command, there is an extra step to take to get the
object to print: including a `results = 'asis'` option in the code chunk. Here
is an example:


```r
library(pander)
pander(head(cars), caption = 'First few rows of the cars dataset.',
       style = 'rmarkdown')
```



|  speed  |  dist  |
|:-------:|:------:|
|    4    |   2    |
|    4    |   10   |
|    7    |   4    |
|    7    |   22   |
|    8    |   16   |
|    9    |   10   |

Table: First few rows of the cars dataset.

## Figures in the markdown file

Just like you can get R to create a table, you can also get R to create a
figure. There are several chunk options for creating figures, including `fig.height`, `fig.width`, `dpi`, and `fig.cap`.















