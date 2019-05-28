# Contributing

Thanks for your interest in contributing to the task view! If you have a
suggestion for a package, please open an [Issue][issues]. In the Issue, please
provide the link to the package on CRAN and a brief description of why you think
it fits within the scope of "project workflows". If it is decided the package
should be added, we will invite you to submit a [Pull Request][pull-requests].

For any typos and other minor edits, please feel free to commit your changes and
submit a [Pull Request][pull-requests]. The source file to edit is
`ProjectWorkflows.md`.

[issues]: https://github.com/jdblischak/ctv-project-workflows/issues
[pull-requests]: https://github.com/jdblischak/ctv-project-workflows/pulls

## Building the CTV and HTML files

The script `build.R` builds the CTV and HTML files from the source file
`ProjectWorkflows.md`. It is not necessary to run this script to submit a Pull
Request. However, if you want to view how your changes will be display, you can
execute this script. It requires the following packages to be installed:

* ctv
* fs
* glue
* rmarkdown
* stringr
