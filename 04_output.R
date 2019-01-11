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

ProvRast<-raster(nrows=15744, ncols=17216, xmn=159587.5, xmx=1881187.5,
                 ymn=173787.5, ymx=1748187.5,
                 crs="+proj=aea +lat_1=50 +lat_2=58.5 +lat_0=45 +lon_0=-126 +x_0=1000000 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0",
                 res = c(100,100), vals = 0)

BCr_file <- file.path(StrataDir,"BCr.tif")
if (!file.exists(BCr_file)) {
  BCr <- fasterize(bcmaps::bc_bound_hres(class='sf'),ProvRast)
  writeRaster(BCr, filename=BCr_file, format="GTiff", overwrite=TRUE)
} else {
  BCr <- raster(BCr_file)
}

# Human Density output
#Dump as shape to inspect.
st_write(HumanMap, file.path(spatialOutDir,'HumanDensity.shp'), delete_layer = TRUE)

HumanDensityR<-mask(fasterize(HumanMap, ProvRast, field='HumanDensity'),BCr)
writeRaster(HumanDensityR, filename=file.path(spatialOutDir,"HumanDensityR.tif"), format="GTiff", overwrite=TRUE)

# Livestock Density output
#Dump as shape to inspect.
st_write(LSMap, file.path(spatialOutDir,'LivestockDensity.shp'), delete_layer = TRUE)

#fasterize and write to directory for 02_clean.R script
LiveStockDensityR<-mask(fasterize(LSMap, ProvRast, field='LSdensity_km2'),BCr)
#CowDensityR<-setValues(raster(CDR1), CDR1[]) #vestigual code

writeRaster(LiveStockDensityR, filename=file.path(spatialOutDir,"LSDensityR.tif"), format="GTiff", overwrite=TRUE)




