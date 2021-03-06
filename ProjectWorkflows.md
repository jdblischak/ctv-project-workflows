---
name: ProjectWorkflows
topic: Project Workflows
maintainer:
  - John Blischak
  - Anna Krystalli
  - Ben Marwick
  - Daniel Nüst
email: "jdblischak@gmail.com"
---

Successfully completing a data analysis project often requires much more than
statistics and visualizations. Efficiently managing the code, data, and results
as the project matures helps reduce stress and errors. The CRAN packages in this
Task View assist the R programmer by managing project infrastructure and/or
facilitating a reproducible workflow.

If you'd like to suggest a package to include in this Task View, please open an
[Issue on GitHub][issues].

[issues]: https://github.com/jdblischak/ctv-project-workflows/issues

## Utilities

These packages provide single-use functions to implement project infrastructure
or solve a specific problem. As a typical example, `usethis::use_git()`
initializes a Git repository, ignores common R files, and commits all project
files.

* [cabinets][]
* [here][]
* [prodigenr][]
* [RepoGenerator][]
* rrtools ([GitHub only][rrtools])
* starters ([GitHub only][starters])
* [usethis][]

[cabinets]: https://cran.r-project.org/package=cabinets
[here]: https://cran.r-project.org/package=here
[prodigenr]: https://cran.r-project.org/package=prodigenr
[RepoGenerator]: https://cran.r-project.org/package=RepoGenerator
[rrtools]: https://github.com/benmarwick/rrtools
[starters]: https://github.com/lockedata/starters
[usethis]: https://cran.r-project.org/package=usethis

## Frameworks

These packages provide an organized directory structure and helper functions to
assist during the development of the project. As a typical example,
`ProjectTemplate::create.project()` creates an organized setup with many
subdirectories, and `ProjectTemplate::run.project()` executes each R script that
is saved in the `src/` subdirectory.

* [adapr][]
* [archivist][]
* [DataPackageR][]
* [exreport][]
* [madrat][]
* [makeProject][]
* [projects][]
* [ProjectTemplate][]
* [reports][]
* [represtools][]
* [RSuite][]
* [tinyProject][]
* [workflowr][]
* [zoon][]

[adapr]: https://cran.r-project.org/package=adapr
[archivist]: https://cran.r-project.org/package=archivist
[DataPackageR]: https://cran.r-project.org/package=DataPackageR
[exreport]: https://cran.r-project.org/package=exreport
[madrat]: https://cran.r-project.org/package=madrat
[makeProject]: https://cran.r-project.org/package=makeProject
[projects]: https://cran.r-project.org/package=projects
[ProjectTemplate]: https://cran.r-project.org/package=ProjectTemplate
[reports]: https://cran.r-project.org/package=reports
[represtools]: https://cran.r-project.org/package=represtools
[RSuite]: https://cran.r-project.org/package=RSuite
[tinyProject]: https://cran.r-project.org/package=tinyProject
[workflowr]: https://cran.r-project.org/package=workflowr
[zoon]: https://cran.r-project.org/package=zoon

## Pipelines

These packages implement complex pipelines for processing data in a series of
interdependent steps. As a typical example, `drake::make()` builds the
dependency graph from the defined analysis steps and only executes those steps
whose upstream dependencies have been updated.

* [drake][]
* [repo][]

[drake]: https://cran.r-project.org/package=drake
[repo]: https://cran.r-project.org/package=repo

## Related links

* CRAN Task View: [Reproducible Research][ctv-rr]
* [Computational Environments and Reproducibility][tv-env]
* [Project-oriented workflow by Jenny Bryan][project-oriented-workflow]
* [rOpenSci: Reproducibility in Science][ropensci-guide]

[ctv-rr]: https://cran.r-project.org/view=ReproducibleResearch
[tv-env]: https://github.com/o2r-project/ctv-computational-environments#readme
[project-oriented-workflow]: https://www.tidyverse.org/articles/2017/12/workflow-vs-script/
[ropensci-guide]: https://ropensci.github.io/reproducibility-guide/
