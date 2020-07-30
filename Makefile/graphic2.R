#################################################################
#             Graphic 2 Makefile - script mouse                 #
#                       November/2015                           #
#           Cristiane Taniguti and Letícia Lara                 #
#################################################################

library(ggplot2)
library(dplyr)
library(tidyr)

data1 <- read.csv("mouse.csv")

data2 <- data1 %>%
  select(IND, BW, starts_with('M')) %>%
  pivot_longer(starts_with('M'), names_to = "Markers", values_to = "Genotype") %>%
  rename(ID = "IND",
         Phenotype = "BW")

jpeg("Figures/graphic2.jpeg")

ggplot (data = data2) +
  geom_boxplot (aes (y = Phenotype, x = as.factor(Genotype), fill = factor(Genotype))) +
  facet_wrap(~Markers) +
  xlab("Markers")

dev.off()

