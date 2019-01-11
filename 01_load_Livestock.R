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

#livestock/km2 by Stats Can -  by Census Consolidated Subdivision  (CCS)
#A census consolidated subdivision (CCS) is a group of adjacent census subdivisions within the same census division. Generally, the smaller, more densely-populated census subdivisions (towns, villages, etc.) are combined with the surrounding, larger, more rural census subdivision, in order to create a geographic level between the census subdivision and the census division.
#spatial file of Census consolidated subdivisions https://www12.statcan.gc.ca/census-recensement/2011/geo/bound-limit/bound-limit-2016-eng.cfm-
#

source("header.R")

#Read in  'Census consolidated subdivisions' finest resolution for cows and sheep data
#Map available from: https://www12.statcan.gc.ca/census-recensement/2011/geo/bound-limit/bound-limit-2016-eng.cfm
#Projection is from https://www150.statcan.gc.ca/n1/pub/92-160-g/92-160-g2016002-eng.htm
#file name lccs000a16a_e
#
CensusConSubs_LCCproj<-st_read(dsn=file.path(DataDir,'Livestock'), stringsAsFactors = FALSE,
                               crs = '+proj=lcc +lat_1=49 +lat_2=77 +lat_0=63.390675 +lon_0=-91.86666666666666 +x_0=6200000 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs')

#Transform from Stats Canada Lambert: +proj=lcc +lat_1=49 +lat_2=77 +lat_0=63.390675 +lon_0=-91.86666666666666 +x_0=6200000 +y_0=3000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs
#To BC Lambert:  +proj=aea +lat_1=50 +lat_2=58.5 +lat_0=45 +lon_0=-126 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs
CensusConSubs = st_transform(CensusConSubs_LCCproj, "+proj=aea +lat_1=50 +lat_2=58.5 +lat_0=45 +lon_0=-126 +x_0=1000000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")

#
Livestock Data
#Cattle and Calves - https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3210042401
#Sheep and Lambs - https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3210042501

#Read in sheep and cows and subset to Total amounts
Sheep <- data.frame(read.csv(header=TRUE, file=file.path(DataDir,'Livestock/32100425-eng/32100425.csv'), strip.white=TRUE, ))
TotalSheep<-subset.data.frame(Sheep, Sheep.and.lambs=='Total sheep and lambs' & Unit.of.measure=='Number of animals' & REF_DATE==2016)

Cows <- data.frame(read.csv(header=TRUE, file=file.path(DataDir,'Livestock/32100424-eng/32100424.csv'), strip.white=TRUE, ))
TotalCows<-subset.data.frame(Cows, Cattle.and.calves=='Total cows' & Unit.of.measure=='Number of animals' & REF_DATE==2016)

