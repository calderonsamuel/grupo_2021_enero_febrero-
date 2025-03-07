# ¿La política es ancha y ajena?: Participación política de la mujer en las elecciones congresales {#participacion-mujeres}


```r
knitr::opts_chunk$set(fig.align = "center")
```


Históricamente la representación política estuvo enmarcada por la elección de representantes mediante el voto ciudadano. No obstante, existen características extrínsecas propios del concepto de “ciudadanía”. Por ende, el significado de representación política ha variado producto de diversos cambios ocurrido a lo largo de la historia peruana.
Para la elaboración de este ensayo se utilizarán los siguientes paquetes: Tidyverse, readxl y ggthemes. Estos permitirán: manipular, importar, explorar y representar gráficamente el análisis que se pretende mostrar.
Asimismo, la base de datos utilizada fue extraída del portal institucional infogob.pe. Particularmente se extrajo información concerniente a las y los candidatos en las elecciones congresales del año 1995, 2000, 2001, 2006, 2011 y 2016.  
En esta ocasión, la directriz del análisis será a partir del cruce entre las siguientes variables: sexo, organización política y distrito electoral; a fin de mostrar la variación o no, en torno al nivel de participación de mujeres en listas congresales desde 1995 hasta el año 2016.


```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
## ✓ tibble  3.1.0     ✓ dplyr   1.0.3
## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
## ✓ readr   1.4.0     ✓ forcats 0.5.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(readxl)
library(ggthemes)
```



```r
autoridades1995 <- read_excel("data/EG1995_Candidatos_Congresal.xlsx")
autoridades1995 <- autoridades1995 %>% select(-c(Cargo, `N°`))
autoridades1995 <- autoridades1995 %>% mutate(Año_eleccion = "1995")

autoridades2000 <- read_excel("data/EG2000_Candidatos_Congresal.xlsx")
autoridades2000 <- autoridades2000 %>% select(-c(Cargo, `N°`))
autoridades2000 <- autoridades2000 %>% mutate(Año_eleccion = "2000")

autoridades2001 <- read_excel("data/EG2001_Candidatos_Congresal.xlsx")
autoridades2001 <- autoridades2001 %>% select(-c(Cargo, `N°`))
autoridades2001 <- autoridades2001 %>% mutate(Año_eleccion = "2001")

autoridades2006 <- read_excel("data/EG2006_Candidatos_Congresal.xlsx")
autoridades2006 <- autoridades2006 %>% select(-c(Cargo, `N°`))
autoridades2006 <- autoridades2006 %>% mutate(Año_eleccion = "2006")

autoridades2011 <- read_excel("data/EG2011_Candidatos_Congresal.xlsx")
autoridades2011 <- autoridades2011 %>% select(-c(Cargo, `N°`))
autoridades2011 <- autoridades2011 %>% mutate(Año_eleccion = "2011")

autoridades2016 <- read_excel("data/EG2016_Candidatos_Congresal.xlsx")
autoridades2016 <- autoridades2016 %>% select(-c(Cargo, `N°`))
autoridades2016 <- autoridades2016 %>% mutate(Año_eleccion = "2016")

Candidatos_congresales <-
  bind_rows(
    autoridades1995,
    autoridades2000,
    autoridades2001,
    autoridades2006,
    autoridades2011,
    autoridades2016
  )
```

## Los vaivenes de la participación de mujeres en listas congresales desde 1995 hasta 2016.

Podríamos decir que el congreso se conforma a imagen y semejanza del voto ciudadano, y a su vez la ciudadanía en sí responde a las circunstancias históricas que se viven en determinado momento. Entonces, veremos cómo ha cambiado periodo tras periodo el nivel de participación de mujeres en la lucha por conseguir un escaño en dicha institución.
Tomando en cuenta la información histórica de las elecciones realizadas en 1995 hasta 2016 se logra apreciar el cambio ocurrido elección tras elección, en lo que concierne, porcentualmente, al número de mujeres que conformaron las listas congresales.


```r
historico <- Candidatos_congresales %>%
  count(Año_eleccion, Sexo, ) %>%
  group_by(Año_eleccion) %>%
  mutate(porcentaje = n / sum(n) * 100) %>%
  ggplot(aes(Año_eleccion, porcentaje, color = Sexo, group = Sexo)) +
  geom_line()

historico +
  theme_clean() +
  labs(
    title = "Evolución historica de la participación de mujeres candidatas \ndesde 1995 hasta 2006",
    subtitle = "Distribución porcentual",
    caption = "Fuente: infogob",
    x = "Años",
    y = "Porcentaje de participación",
    color = "sexo",
    shape = "sexo"
  )
```

<div class="figure" style="text-align: center">
<img src="03-christian_files/figure-html/chris-historico-1.png" alt="Evolución historica de la participación de mujeres candidatas desde 1995 hasta 2006" width="672" />
<p class="caption">(\#fig:chris-historico)Evolución historica de la participación de mujeres candidatas desde 1995 hasta 2006</p>
</div>

Como se muestra en el gráfico precedente, en 1995 el nivel de participación de mujeres era solo de 12.82%. No obstante, para las elecciones del 2000 (observando una evolución ascendente) el nivel de representación fue de 25.83%. Este cambio denota crecimiento significativo entre un periodo y otro respecto al número de mujeres que participaron en dicho periodo electoral. 
Tomando en cuenta el nivel de crecimiento que hubo desde 1995 hasta 2011 (39.40%), existió un cambio progresivo, tal como se observa. Sin embargo, cabe preguntarse ¿Cómo se da este cambio a nivel de distrito electoral? ¿Cómo se da este cambio a nivel de organizaciones políticas? Pues estas son características importantes a tomar en cuenta en este análisis de referido a la participación política.

## Éxodo de las mujeres en la representación política: Mujeres y distritos electorales

Para esta sección, se tomará en cuenta 6 distritos electorales elegidos al azar, el cual permitirá observar, de forma segmentada, el nivel de participación de las mujeres por distrito electoral. Este análisis será realizado con información de las elecciones del 2001, 2006, 2011 y 2016.

## Elecciones 2001

En el siguiente gráfico, observaremos la distribución por distritos electorales, talvez dando inicio a una nueva etapa en la concepción de la idea de participación política de las mujeres.


```r
distritos2001 <- Candidatos_congresales %>%
  filter(Año_eleccion == "2001") %>%
  count(`Distrito Electoral`, Sexo) %>%
  group_by(`Distrito Electoral`) %>%
  mutate(porcentaje = n / sum(n) * 100) %>%
  mutate(porcentajes = round(porcentaje)) %>%
  ungroup() %>%
  filter(
    `Distrito Electoral` %in% c("AMAZONAS", "LIMA", "AREQUIPA", "CALLAO", "LORETO", "MOQUEGUA")
  ) %>%
  ggplot(aes(x = porcentaje , y = `Distrito Electoral`, fill = Sexo)) +
  geom_col()

distritos2001 +
  theme_clean() +
  labs(
    title = "Participación de mujeres por distrito electoral",
    subtitle = "Elección congresal 2001",
    caption = "Fuente: infogob",
    x = "Porcentaje de participación",
    y = "Distritos electorales",
    color = "sexo",
    shape = "sexo"
  )
```

<div class="figure" style="text-align: center">
<img src="03-christian_files/figure-html/chris-distritos1-1.png" alt="Participación de mujeres por distrito electoral, 2001" width="672" />
<p class="caption">(\#fig:chris-distritos1)Participación de mujeres por distrito electoral, 2001</p>
</div>

Conociendo el promedio porcentual de mujeres participantes en el 2001 (35.72%), la situación en estos distritos electorales resulta similar a excepción de Arequipa, quien llega tener un 40% de mujeres el las listas congresales. Por parte de los otros distritos electorales, el nivel de representación en el 2001 fue el siguiente: Loreto 36.84%, Amazonas 36.11%, Lima 35.16% y Callao con 30.76%.

## Elecciones 2006

En este periodo el promedio de mujeres participantes en listas congresales fue de 38.56%, un ligero cambio al periodo electoral anterior. Sin embargo, existen cambios particulares al observar el comportamiento por distritos electorales, como bien se observa en el siguiente gráfico:


```r
distrito2006 <- Candidatos_congresales %>%
  filter(Año_eleccion == "2006") %>%
  count(`Distrito Electoral`, Sexo) %>%
  group_by(`Distrito Electoral`) %>%
  mutate(porcentaje = n / sum(n) * 100) %>%
  mutate(porcentajes = round(porcentaje)) %>%
  ungroup() %>%
  filter(
    `Distrito Electoral` %in% c("AMAZONAS", "LIMA", "AREQUIPA", "CALLAO", "LORETO", "MOQUEGUA")
  ) %>%
  ggplot(aes(x = porcentaje , y = `Distrito Electoral`, fill = Sexo)) +
  geom_col()

distrito2006 +
  theme_clean() +
  labs(
    title = "Participación de mujeres por distrito electoral",
    subtitle = "Elección congresal 2006",
    caption = "Fuente: infogob",
    x = "Porcentaje de participación",
    y = "Distritos electorales",
    color = "sexo",
    shape = "sexo"
  )
```

<div class="figure" style="text-align: center">
<img src="03-christian_files/figure-html/chris-distritos2-1.png" alt="Participación de mujeres por distrito electoral, 2006" width="672" />
<p class="caption">(\#fig:chris-distritos2)Participación de mujeres por distrito electoral, 2006</p>
</div>

Como se aprecia, Callao llega a tener un 52.17% de mujeres en listas congresales, caso contrario de los otros distritos como Arequipa con 42.57%, Loreto con 40%, Amazonas con 38.29% y Lima con 32.97%.
Para este periodo electoral logran resaltar dos aspectos: 1) Callao, de ser el distrito electoral con menor representación de mujeres en listas congresales, en este periodo es quien supera el 50%, y 2) Lima sigue siendo el distrito electoral con menor representación de mujeres en listas congresales.


## Elecciones 2011

El nivel de representación para el año 2011 fue de 39.40%, el cual denota un ligero crecimiento respecto al año electoral anterior. No obstante, para este año ¿qué cambios habrán a nivel distrito electoral? y ¿Lima será nuevamente el distrito electoral com menor representación de mujeres en listas congresales? Estas interrogantes logran resolverse observando el siguiente gráfico:


```r
distrito2011 <- Candidatos_congresales %>%
  filter(Año_eleccion == "2011") %>%
  count(`Distrito Electoral`, Sexo) %>%
  group_by(`Distrito Electoral`) %>%
  mutate(porcentaje = n / sum(n) * 100) %>%
  mutate(porcentajes = round(porcentaje)) %>%
  ungroup() %>%
  filter(
    `Distrito Electoral` %in% c(
      "AMAZONAS",
      "AREQUIPA",
      "CALLAO",
      "LIMA + RESIDENTES EN EL EXTRANJERO",
      "LORETO",
      "MOQUEGUA"
    )
  ) %>%
  ggplot(aes(x = porcentaje , y = `Distrito Electoral`, fill = Sexo)) +
  geom_col()

distrito2011 +
  theme_clean() +
  labs(
    title = "Participación de mujeres por distrito electoral",
    subtitle = "Elección congresal 2011",
    caption = "Fuente: infogob",
    x = "Porcentaje de participación",
    y = "Distritos electorales",
    color = "sexo",
    shape = "sexo"
  )
```

<div class="figure" style="text-align: center">
<img src="03-christian_files/figure-html/chris-distritos3-1.png" alt="Participación de mujeres por distrito electoral, 2011" width="672" />
<p class="caption">(\#fig:chris-distritos3)Participación de mujeres por distrito electoral, 2011</p>
</div>

Como bien se observa; Loreto logra un 50% de participación femenina, Callao logra 48.83%, Amazonas logra 37.50, Lima + residentes en el extranjero 33.93% y por último Arequipa con 32.35%. Nuevamente Callao sigue siendo uno de los distritos electorales que supera el nivel de participación promedio y Lima sigue siendo el distrito electoral con menor participación de mujeres como candidatas al congreso.

## Elecciones 2016

El nivel de representación para el año 2016 fue de 39.06%, el cual denota un ligero retroceso respecto al año electoral anterior. No obstante, este año logra mantener cierta tendencia en algunos distritos electorales como bien se muestra en el siguiente gráfico:


```r
distrito2016 <- Candidatos_congresales %>%
  filter(Año_eleccion == "2016") %>%
  count(`Distrito Electoral`, Sexo) %>%
  group_by(`Distrito Electoral`) %>%
  mutate(porcentaje = n / sum(n) * 100) %>%
  mutate(porcentajes = round(porcentaje)) %>%
  ungroup() %>%
  filter(
    `Distrito Electoral` %in% c(
      "AMAZONAS",
      "AREQUIPA",
      "CALLAO",
      "LIMA + RESIDENTES EN EL EXTRANJERO",
      "LORETO",
      "MOQUEGUA"
    )
  ) %>%
  ggplot(aes(x = porcentaje , y = `Distrito Electoral`, fill = Sexo)) +
  geom_col()

distrito2016 +
  theme_clean() +
  labs(
    title = "Participación de mujeres por distrito electoral",
    subtitle = "Elección congresal 2011",
    caption = "Fuente: infogob",
    x = "Porcentaje de participación",
    y = "Distritos electorales",
    color = "sexo",
    shape = "sexo"
  )
```

<div class="figure" style="text-align: center">
<img src="03-christian_files/figure-html/chris-distritos4-1.png" alt="Participación de mujeres por distrito electoral, 2016" width="672" />
<p class="caption">(\#fig:chris-distritos4)Participación de mujeres por distrito electoral, 2016</p>
</div>

Una vez más Callao (51.28%), Loreto (47.05%) y Amazonas (43.47%) son los distritos con mayor porcentaje de mujeres en listas congresales. Caso contrario Arequipa (35.59%), Lima + residentes en el extranjero (34.27%) y Moquegua (32.14%). Estos últimos mantiene una tendencia por debajo del promedio general (39.06%). Esta gráfica nos muestra a Lima nuevamente con un porcentaje menor, teniendo en cuenta el número de escaños que le corresponde expresa cierta desigualdad en torno al número de candidatas mujeres. Empero, cabe preguntarse ¿qué números ocuparon estas candidatas en estos distritos de mayor y menor representación? Pero, por ahora no abordaremos ese tema.

## Banderas políticas: Relación de la mujer y organización política

Anteriormente, logramos graficar el nivel porcentual de mujeres candidatas en 6 distritos electorales, ello nos mostró ciertas tendencias positivas en algunos distritos electorales y otras que se mantenían por debajo de promedio.
En esta ocasión, veremos el cambio temporal desde 1995 al 2016, pero a nivel de tipo de organización política. Para 1995 se mostrarán 3 tipos: Partido político, Alianza política y Lista independiente. Por otro lado, para 2011 solo 2 tipos: Partido político y Alianza electoral.

### Elecciones 1995

Este periodo electoral se puede catalogar como un periodo oscuro, ya que los niveles de participación eran muy bajos. Recordemos que la naturaleza de una organización política es en cierta medida el seno de representación institucional, ya que este tiene como objetivo posicionar a sus representantes en el poder ejecutivo y legislativo. Sin embargo, al desagregar las listas por sexo, el resultado es el siguiente:


```r
tipodeorganización95 <- Candidatos_congresales %>%
  filter(Año_eleccion == "1995") %>%
  count(`Tipo Organización Política`, Sexo, ) %>%
  group_by(`Tipo Organización Política`) %>%
  mutate(porcentaje = n / sum(n) * 100) %>%
  mutate(porcentajes = round(porcentaje)) %>%
  ungroup() %>%
  ggplot(aes(x = porcentaje , y = `Tipo Organización Política`, fill = Sexo)) +
  geom_col()

tipodeorganización95 +
  theme_clean() +
  labs(
    title = "Participación de mujeres por Organización Política",
    subtitle = "Distribución segun el tipo de Organziación Política",
    caption = "Fuente: infogob",
    x = "Tipo de Organización Política",
    y = "Porcentaje de participación",
    color = "sexo",
    shape = "sexo"
  )
```

<div class="figure" style="text-align: center">
<img src="03-christian_files/figure-html/chris-org1-1.png" alt="Participación de mujeres por Organización Política, 1995" width="672" />
<p class="caption">(\#fig:chris-org1)Participación de mujeres por Organización Política, 1995</p>
</div>
 
Para el periodo electoral en mención, las alianzas electorales solo consignaban un 7.5% de mujeres en sus listas, los partidos políticos un 13.22% y las listas independientes un 14.91%. Estas cifran denotan un periodo electoral mayoritariamente masculino, por ende, el abanico de opciones era mayoritariamente masculino.


### Elecciones 2016

Para el año 2016 la situación es totalmente diferente, pues de un porcentaje menor al 15% en 1995, para este periodo las alianzas electorales poseen un 39.48% de mujeres candidatas y los partidos políticos incorporan un 38.95% de mujeres en sus listas. 
Estas son cifras ciertamente alentadoras si son comparadas con el periodo electoral de 1995. No obstante, recordemos que estos cambios de incorporación de mujeres estuvieron amparados por un marco normativo, cabe preguntarnos ¿Cuál sería el nivel de mujeres candidatas si no se hubieran incorporado normativas de inclusión en las listas congresales?



```r
tipodeorganizacion16 <- Candidatos_congresales %>%
  filter(Año_eleccion == "2016") %>%
  count(`Tipo Organización Política`, Sexo, ) %>%
  group_by(`Tipo Organización Política`) %>%
  mutate(porcentaje = n / sum(n) * 100) %>%
  mutate(porcentajes = round(porcentaje)) %>%
  ungroup() %>%
  ggplot(aes(x = porcentaje , y = `Tipo Organización Política`, fill = Sexo)) +
  geom_col()

tipodeorganizacion16 +
  theme_clean() +
  labs(
    title = "Participación de mujeres por Organización Política",
    subtitle = "Distribución segun el tipo de Organziación Política",
    caption = "Fuente: infogob",
    x = "Tipo de Organización Política",
    y = "Porcentaje de participación",
    color = "sexo",
    shape = "sexo"
  )
```

<div class="figure" style="text-align: center">
<img src="03-christian_files/figure-html/chris-org2-1.png" alt="Participación de mujeres por Organización Política, 2016" width="672" />
<p class="caption">(\#fig:chris-org2)Participación de mujeres por Organización Política, 2016</p>
</div>

## La idea y la realidad: Reflexiones finales camino al bicentenario

Recordemos el título de este trabajo "¿La política es ancha y ajena?". La historia no muestra que sí, periodo tas periodo ha sido una lucha por ir ganando terreno en materia de representación no solo por parte de las mujeres, también por otras minorías que no se sienten representadas. Si bien, cada ciudadano y ciudadana ejerce su decisión mediante el voto, el abanico de opciones ha sido predominantemente masculino.  
Este trabajo nos abre una serie de interrogantes dignos de análisis, pues ¿qué pasa en el caso de regidores y regidoras, candidatos y candidatas a una alcandía, candidatos y candidatas a un gobierno regional? ¿Cómo se componen las cúpulas de toma de decisión de las organizaciones políticas? Estamos cerca de presenciar un nuevo panorama en abril del 2021, ¿La idea se hará realidad o seguirá en el imaginario soñador de una representación más equitativa?


