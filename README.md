Trabajos con Plantas Extintas (Clase 2 Derek Corcoran)
================

# Introducción

En este documento trabajaremos para explorar la identidad de plantas que
se encuentran extintas en silvestría o totalmente extintas según la
[*IUCN*](https://www.iucnredlist.org/)

## Trabajando con los datos

Vamos a partir por cargar los paquetes necesarios para trabajar

``` r
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.3     v purrr   0.3.4
    ## v tibble  3.0.6     v dplyr   1.0.5
    ## v tidyr   1.1.2     v stringr 1.4.0
    ## v readr   1.4.0     v forcats 0.5.1

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Ahora voy a leer los datos con los que voy a trabajar

``` r
plantas <- readr::read_csv( 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv' )
```

    ## 
    ## -- Column specification --------------------------------------------------------
    ## cols(
    ##   .default = col_double(),
    ##   binomial_name = col_character(),
    ##   country = col_character(),
    ##   continent = col_character(),
    ##   group = col_character(),
    ##   year_last_seen = col_character(),
    ##   red_list_category = col_character()
    ## )
    ## i Use `spec()` for the full column specifications.

## Filtrando los datos para resolver el ejemplo 1

El código que voya a ejecutar ahora, es para resolver el problema en el
siguiente
[slide](https://github.com/derek-corcoran-barrios/derek-corcoran-barrios.github.io/blob/master/Clase2/Clase2InvestigacionReproducible.Rmd),
para poner dentro de la base de datos sólo los datos de Chile, y sólo
usar las columnas para país (*country*), la especie (*binomial\_name*) y
la categoría de IUCN (*red\_list\_cateogry*).

``` r
Chile <- plantas %>%
  dplyr::filter(country == "Chile") %>%
  dplyr::select(binomial_name, country, red_list_category)

Chile
```

    ## # A tibble: 2 x 3
    ##   binomial_name           country red_list_category  
    ##   <chr>                   <chr>   <chr>              
    ## 1 Santalum fernandezianum Chile   Extinct            
    ## 2 Sophora toromiro        Chile   Extinct in the Wild

## Resumen de Especies por País

``` r
Resumen <- plantas %>%
  dplyr::filter(continent == "South America") %>% 
  group_by(country) %>%
  summarise(n_especies = n())

Resumen
```

    ## # A tibble: 9 x 2
    ##   country             n_especies
    ##   <chr>                    <int>
    ## 1 Argentina                    1
    ## 2 Bolivia                      1
    ## 3 Brazil                      10
    ## 4 Chile                        2
    ## 5 Colombia                     6
    ## 6 Ecuador                     52
    ## 7 Peru                         4
    ## 8 Trinidad and Tobago          6
    ## 9 Venezuela                    1
