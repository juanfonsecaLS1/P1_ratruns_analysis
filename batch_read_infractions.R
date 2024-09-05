library(tidyverse)


lst_files <- list.files("../00_data/bogota/",pattern = "\\.csv$",full.names = T)


raw_data <- lapply(lst_files,read_csv)


lapply(raw_data,names)
