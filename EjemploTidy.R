library(tidyverse)

data("mtcars")

MT <- mtcars %>%
  dplyr::filter(cyl == 8)
