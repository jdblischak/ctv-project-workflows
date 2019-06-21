#!/usr/bin/env Rscript

# Usage: Rscript build.R
#
# Required packages:
#   * ctv
#   * fs
#   * glue
#   * rmarkdown
#   * stringr

## Settings --------------------------------------------------------------------

file_md <- "ProjectWorkflows.md"
file_ctv <- "ProjectWorkflows.ctv"
file_html <- "index.html"

## Basic information -----------------------------------------------------------

stopifnot(fs::file_exists(file_md))
header <- rmarkdown::yaml_front_matter(file_md)

ctv_name <- header$name
ctv_topic <- header$topic
ctv_maintainer <- paste(header$maintainer, collapse = ", ")
ctv_email <- header$email
ctv_version <- Sys.Date()
ctv_url <- glue::glue("https://CRAN.R-project.org/view={ctv_name}")

## Main text -------------------------------------------------------------------

# First convert to temporary HTML file
file_html_tmp <- fs::file_temp(ext = "html")
rmarkdown::render(input = file_md,
                  output_format = rmarkdown::html_document_base(),
                  output_file = file_html_tmp,
                  quiet = TRUE)
stopifnot(fs::file_exists(file_html_tmp))
lines_raw <- readLines(file_html_tmp)
lines_clean <- lines_raw
lines_clean <- lines_clean[stringr::str_detect(lines_clean, "^<p>") |
                           stringr::str_detect(lines_clean, "^<ul>") |
                           stringr::str_detect(lines_clean, "^<li>") |
                           stringr::str_detect(lines_clean, "^</ul>") |
                           stringr::str_detect(lines_clean, "^<h2")]
line_related_links <- stringr::str_which(lines_clean, "<h2.*Related links.*</h2>")
stopifnot(length(line_related_links) == 1)
ctv_info <- lines_clean[seq_len(line_related_links - 1)]
ctv_info <- paste(ctv_info, collapse = "\n")

## Package list ----------------------------------------------------------------

available <- rownames(available.packages())
pkgs <- stringr::str_match_all(ctv_info,
                             '<a href="(http.+)">(\\S+)</a>')
stopifnot(length(pkgs) == 1)
pkgs <- as.data.frame(pkgs[[1]], stringsAsFactors = FALSE)
colnames(pkgs) <- c("html", "url", "name")
pkgs <- pkgs[order(pkgs$name), ]
pkgs_cran <- pkgs$name %in% available

ctv_packagelist <- glue::glue("<pkg>{pkgs$name[pkgs_cran]}</pkg>")
ctv_packagelist <- paste(ctv_packagelist, collapse = "\n")

## Related links ---------------------------------------------------------------

ctv_links <- lines_clean[seq(line_related_links, length(lines_clean))]
ctv_links <- stringr::str_match(ctv_links, "<a.+</a>")
ctv_links <- ctv_links[!is.na(ctv_links)]
ctv_links <- stringr::str_replace(ctv_links,
                                  '<a.+"https://cran.r-project.org/view=(.+)".+',
                                  "<view>\\1</view>")
ctv_links <- paste(ctv_links, collapse = "\n")
# ctv_links <- "<view>ReproducibleResearch</view>"

## Output CTV file -------------------------------------------------------------

ctv_output <- glue::glue("
<CRANTaskView>
<name>{ctv_name}</name>
<topic>{ctv_topic}</topic>
<maintainer email=\"{ctv_email}\">{ctv_maintainer}</maintainer>
<version>{ctv_version}</version>
<url>{ctv_url}</url>
<info>
{ctv_info}
</info>
<packagelist>
{ctv_packagelist}
</packagelist>
<links>
{ctv_links}
</links>
</CRANTaskView>
")

writeLines(ctv_output, file_ctv)

## Create HTML file ------------------------------------------------------------

ctv::ctv2html(file_ctv, file_html,
              packageURL = "https://cran.r-project.org/package=")
if (interactive()) browseURL(file_html)


html_in <- readLines(file_html)
html_out <- html_in
# Fix link to ReproducibleResearch Task View
html_out <- stringr::str_replace(html_out,
                                 'href="ReproducibleResearch.html"',
                                 'href="https://cran.r-project.org/web/views/ReproducibleResearch.html"')
# Add edit on GitHub link
html_out <- stringr::str_replace(html_out,
                                 '<head>',
                                 '<head>\n<a href="https://github.com/jdblischak/ctv-project-workflows/edit/master/ProjectWorkflows.md">Edit the Task View</a>')

writeLines(html_out, file_html)
