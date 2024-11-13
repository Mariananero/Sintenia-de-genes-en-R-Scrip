# Sintenia-de-genes-en-R-Scrip
Script en R para visualizar mapas de CDS con gggenes y ggplot2

## Mapa de CDS con gggenes y ggplot2

Este repositorio contiene un script en R diseñado para visualizar mapas de regiones codificantes (CDS) utilizando las librerías `gggenes` y `ggplot2`. Este script procesa datos de anotación genómica en formato GenBank (`.gbk`) y genera gráficos que incluyen flechas direccionales y etiquetas de genes.

## Características
- Lectura de archivos `.gbk` utilizando la librería `genbankr`.
- Visualización de regiones codificantes con flechas que indican la dirección de transcripción.
- Personalización de colores y escalas.
- Adición de etiquetas con los nombres de los genes.

## Requisitos
Antes de ejecutar el script, asegúrate de tener instalados los siguientes paquetes en R:
- `genbankr`
- `gggenes`
- `ggplot2`
- `dplyr`

Puedes instalarlos con:
```R
install.packages(c("ggplot2", "dplyr"))
BiocManager::install("genbankr") 
```

## Uso
1. Descarga tu archivo `.gbk` y coloca su ruta en el script:
   ```R
   gb_data <- readGenBank("ruta/a/tu/archivo.gbk")
   ```
2. Ejecuta el script para generar el gráfico.

El gráfico incluye:
- Posiciones genómicas en el eje X.
- Flechas direccionales que indican el sentido de los CDS.
- Nombres de los genes anotados.

## Contacto
Si tienes dudas o comentarios, puedes escribirme a: [alexianero12@gmail.com](mailto:alexianero12@gmail.com)
