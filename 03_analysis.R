# Copyright 2018 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

source("header.R")

# Human Density Analysis

#Link to the spatial and fasterize
HumanMap<-merge(CensusDisBlk, Human_DB, by='DAUID')
#Report out humans/km2
HumanMap$AreaHa = as.single(st_area(HumanMap)/10000)
HumanMap$Hdensity_KM2=HumanMap$TotalHumans/HumanMap$AreaHa*100

# Livestock Density Ansalysis
#Link to the spatial
LSMap<-merge(CensusConSubs, Livestock_DB, by.x='CCSUID', by.y='ID')
LSMap$AreaHa = as.single(st_area(LSMap)/10000)
LSMap$LSdensity_km2=LSMap$TotalLivestock/LSMap$AreaHa*100


