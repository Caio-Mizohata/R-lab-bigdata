# Lista de pacotes
pkgs <- c(
    'lintr',
    'data.table',
    'languageserver',
    'httpgd',
    'tidyverse',
    'readxl',
    'janitor',
    'rmarkdown',
    'knitr',
    'plotly',
    'caret',
    'lubridate',
    'stringr',
    'forcats',
    'devtools'
)

# Instala os pacotes
install.packages(pkgs, quiet=TRUE, Ncpus = parallel::detectCores())