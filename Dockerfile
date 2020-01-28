FROM rocker/shiny:3.6.1

RUN R -e "install.packages(c('rmarkdown'), repos='http://cran.rstudio.com/')"

RUN R -e "install.packages(c('shinydashboard'), repos='http://cran.rstudio.com/')"

RUN R -e "install.packages(c('periscope'), repos='http://cran.rstudio.com/')"

RUN apt-get install -y --no-install-recommends \
    libssl-dev
RUN R -e "install.packages(c('canvasXpress'), repos='http://cran.rstudio.com/')"

RUN R -e "install.packages(c('future','pbapply','htmlwidgets','dplyr', 'tibble', 'tidyr','RColorBrewer','logging'), repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('BiocManager'); \
          BiocManager::install('multtest')"
RUN R -e "install.packages(c('mutoss'), repos='http://cran.rstudio.com/')"
RUN R -e "install.packages(c('metap'), repos='http://cran.rstudio.com/')"
RUN R -e "install.packages(c('Seurat'), repos='http://cran.rstudio.com/')"

RUN R -e "install.packages(c('shinyjs', 'shinyBS'), repos='http://cran.rstudio.com/')"

RUN apt-get update && apt-get install --yes \
  git
RUN git clone https://github.com/neuhausi/single-cell-viewer

RUN cp -r /single-cell-viewer/shiny_app /srv/shiny-server/

RUN chmod 777 /srv/shiny-server/shiny_app

