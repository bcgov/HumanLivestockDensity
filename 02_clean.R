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

# Clean Humans
#Create a combined data.frame with total livestock, set NA to 0 and
#comparable index based on DGUID to join the Censuse spatial
Human_DB<-
  Humans %>%
  dplyr::select(one_of(c('Geographic.code','Population..2016','Land.area.in.square.kilometres..2016','Population.density.per.square.kilometre..2016')))

colnames(Human_DB)<-c('DAUID','TotalHumans','AreaOnFile_KM2','HumanDensity')

# Clean Livestock
#Create a combined data.frame with total livestock, set NA to 0 and
#comparable index based on DGUID to join the Censuse spatial
Livestock_DB<-
  TotalCows %>%
  left_join(TotalSheep, by='DGUID') %>%
  mutate(NCows = VALUE.x) %>%
  mutate(NSheep = VALUE.y) %>%
  mutate(GEO = GEO.x) %>%
  mutate(TotalLivestock = NCows + NSheep) %>%
  replace(., is.na(.), 0) %>%
  mutate(ID = str_sub(DGUID, start=-7)) %>%
  dplyr::select(one_of(c('ID', 'GEO', 'TotalLivestock', 'NCows','NSheep')))

