<!-- Add a project state badge
See https://github.com/BCDevExchange/Our-Project-Docs/blob/master/discussion/projectstates.md
If you have bcgovr installed and you use RStudio, click the 'Insert BCDevex Badge' Addin. -->
HumanLivestockDensity
=====================

This repository contains [R](https://www.r-project.org/) code that summarizes spatial & tabular census human population, and cows and sheep (livestock) data to assess Human Density and Livestock Density.

Human density - people/km2 - estimated by Census Dissemination Block (DB)

Livestock density - livestock/km2 - estimated by Census consolidated subdivisions

Data
----

[Census Boundary](https://www12.statcan.gc.ca/census-recensement/2011/geo/bound-limit/bound-limit-2016-eng.cfm)

[Census Data](https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/hlt-fst/pd-pl/comprehensive.cfm)

Livestock Data - [Cattle and Calves](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3210042401) & [Sheep and Lambs](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3210042501)

### Usage

There are five core scripts that are required for the analysis, they need to be run in order:

-   01\_load\_Human.R
-   01\_load\_Livestock.R
-   02\_clean.R
-   03\_analysis.R
-   04\_output.R

### Getting Help or Reporting an Issue

To report bugs/issues/feature requests, please file an [issue](https://github.com/bcgov/HumanLivestockDensity/issues/).

### How to Contribute

If you would like to contribute, please see our [CONTRIBUTING](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

### License

    Copyright 2018 Province of British Columbia

    Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an &quot;AS IS&quot; BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and limitations under the License.

------------------------------------------------------------------------

*This project was created using the [bcgovr](https://github.com/bcgov/bcgovr) package.*

This repository is maintained by [ENVEcosystems](https://github.com/orgs/bcgov/teams/envecosystems/members).
