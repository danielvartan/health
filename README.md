
<!-- README.md is generated from README.Rmd. Please edit that file -->

# health

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/danielvartan/health/workflows/R-CMD-check/badge.svg)](https://github.com/danielvartan/health/actions)
[![Codecov test
coverage](https://codecov.io/gh/danielvartan/health/branch/main/graph/badge.svg)](https://codecov.io/gh/danielvartan/health?branch=main)
[![License:
MIT](https://img.shields.io/badge/license-MIT-green)](https://choosealicense.com/licenses/mit/)
[![License: CC BY
4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
<!-- badges: end -->

## Overview

`health` is an R package package that contains all my (Daniel Vartanian)
health data. It represents a personal project that aims to monitor my
body’s expression over time and create a free public record for
posterity.

## Installation

`health` is still at the
[experimental](https://lifecycle.r-lib.org/articles/stages.html#experimental)
stage of development. That means people can use the package and provide
feedback, but it comes with no promises for long term stability.

You can install `health` from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("gipso/health")
```

## Health records

You can find the processed data (tidied, validated, and transformed
version) in the `./data/` folder. The raw data is stored in the
`./inst/extdata/` folder.

I try to update this repository at least once a year. Here’s a list of
all the health data present to date.

### Actigraphy

-   2019-10-31 - 2019-12-10 (40 days) (Device: [ActTrust
    1](https://www.condorinst.com.br/acttrust/))
-   2021-04-24 - 2021-05-30 (36 days) (Device: [ActTrust
    1](https://www.condorinst.com.br/acttrust/))

## License

[![License:
MIT](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/licenses/MIT)
[![License: CC BY
4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

This package and the accompanying data can be used freely, **with the
exception of uses that end up harming myself or others**. The code is
under the [MIT license](https://opensource.org/licenses/mit/) and the
data is under the [Attribution 4.0 International license (CC BY
4.0)](https://creativecommons.org/licenses/by/4.0/).

For questions regarding this repository, send an email to
<danvartan@gmail.com>.

## Citation

If you use `health` in your research, please consider citing it. I put a
lot of work into the collection, analysis and storage of this data, in
addition to the work of building and maintaining a free and open-source
R package. You can find the `health` citation below.

``` r
citation("health")
#> 
#> To cite {health} in publications use:
#> 
#>   Vartanian, D. (2021). {health}: Daniel Vartanian's health data
#>   package. https://danielvartan.github.io/health/.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Unpublished{,
#>     title = {{health}: Daniel Vartanian's health data package},
#>     author = {Daniel Vartanian},
#>     year = {2021},
#>     url = {https://danielvartan.github.io/health/},
#>     note = {Lifecycle: experimental},
#>   }
```
