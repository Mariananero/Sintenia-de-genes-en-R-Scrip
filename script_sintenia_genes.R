#Bibliotecas
library(genbankr)
library(dplyr)
library(gggenes)
library(ggplot2)

gb_data <- readGenBank("ruta/a/tu/archivo/.gbk")
summary(gb_data)  # Resumen del contenido del archivo

cds_data <- gb_data@cds  # Regiones codificantes
genes_data <- gb_data@genes  # Genes

# Convertir a un data frame para análisis
cds_df <- as.data.frame(cds_data)
head(cds_df)

# Preparar los datos para gggenes
cds_for_gggenes <- cds_df %>%
  select(seqnames, start, end, strand, product) %>%  # Seleccionar columnas relevantes que quieras para tu mapa
  rename(molecule = seqnames, gene = product)       # Renombrar para compatibilidad (seqnames=seqid)

# Graficar con anaotaciónes y dirección de las flechas según strand.
ggplot(cds_for_gggenes, aes(xmin = start, xmax = end, y = molecule, fill = gene, forward = strand == "+")) +
  geom_gene_arrow() +
  facet_wrap(~ molecule, scales = "free", ncol = 1) +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "Mapa anotado de CDS",
       x = "Posición en el genoma",
       y = "Secuencia") +
  theme_genes()

#Puedes modificar el eje x para cambiar la posición del genoma manualmente
ggplot(cds_for_gggenes, aes(xmin = start, xmax = end, y = molecule, fill = gene, forward = strand == "+")) +
  geom_gene_arrow() +
  facet_wrap(~ molecule, scales = "free", ncol = 1) +
  scale_fill_brewer(palette = "Set3") +
  scale_x_continuous(breaks = seq(0, 20000, by = 5000),  # Cambia los intervalos de los números en el eje X
                     labels = c("0 kb", "5 kb", "10 kb", "15 kb", "20 kb")) +  # Personaliza las etiquetas
  labs(title = "Mapa anotado de CDS con flechas direccionales",
       x = "Posición en el genoma",
       y = "Secuencia") +
  theme_genes()

# fin(:

