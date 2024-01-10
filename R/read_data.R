pacman::p_load(readxl, tidyverse)


gdrv <- 'G:/.shortcut-targets-by-id/1iMMs61YFu-RkyW7Ip-Z8avZ06BACvugM/Cuco/'

file1 <- 
  read.csv(here::here(gdrv, 'aves_cucoR.csv'), sep = ';') %>%
  janitor::clean_names() %>%
  pivot_longer(cols = starts_with("x"), names_to = 'data', values_to = 'num')
file1$data <- dmy(sub('x', '', file1$data))

unique(file1$nome_comum)

file1 %>%
  filter(nome_comum %in% c("Abelharuco","Abibe", "Lugre", "Tentilhão")) %>%
  ggplot() +
  geom_col(aes(data, num), width = 10) +
  facet_grid(nome_comum~., scales = "free") +
  scale_x_date(breaks = '3 months') +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
