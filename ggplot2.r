

https://github.com/sillasgonzaga/livro_intro_R

Plotando escolas no mapa com R
-------------------------------

#Parte 1:

# Caso não tenha alguma desses pacotes, faça a instalação
# install.packages("dplyr")
# install.packages("tidyr")
# install.packages("stringr")
# install.packages("geobr")
#Se estiver com dificuldade de instalar o geobr acima, utilize o código abaixo
#devtools::install_github("ipeaGIT/geobr", subdir = "r-package")
# install.packages("ggplot2")
library(dplyr)
library(tidyr)
library(stringr)
library(geobr)
library(ggplot2)


#Parte 2:

# Para fazer o download apenas do mapa da cidade de São Paulo, você precisará do código de 7 # dígitos do município. Há duas formas de fazer isso rapidamente. A primeira é olhando no  #site IBGE Cidades. Basta preencher o nome do município no campo de pesquisa que aparecerá o #código no resultado.

cod <- 
  geobr::lookup_muni(name_muni = "São Paulo")$code_muni

print(cod)


# Parte 3:
# Utilizarei simplified = T apenas para baixar um arquivo mais leve.
# Como não realizaremos análises, apenas visualização, 
# o mapa simplificado é suficiente.
municipio <- 
  geobr::read_municipality(code_muni = cod,
                           simplified = T,
                           showProgress = F)
escola <- 
  geobr::read_schools(showProgress = F)


# parte 4: Filtrando escolas:
escola_muni <- escola %>% 
  filter(abbrev_state == "SP",
         name_muni == "São Paulo",
         government_level != "Privada")


# Gerando Gráfico com GGPLOT2:

ggplot(escola_muni) + # Camada inicial: o apoio. Escola é nossa base referência
 geom_sf(data = municipio)+ #segunda camada, o mapa do Brasil, que é um polígono
 geom_sf() # terceira camada a georreferência das escolas

# Diminuindo os pontos:
ggplot(escola_muni) + # Camada inicial: o apoio
 geom_sf(data = municipio)+ #segunda camada, o mapa do Brasil, que é um polígono
 geom_sf(size = 0.8) # terceira camada a georreferência das escolas

# ---------------
ggplot(escola_muni) + # Camada inicial: o apoio
 geom_sf(data = municipio)+ #segunda camada, o mapa do Brasil, que é um polígono
 geom_sf(aes(color = government_level),
         size = 0.5)# terceira camada a georreferência das escolas. Adicionar cores


# Segregando por categoria de educação:

escola_muni_fed <- 
  escola_muni %>%
  mutate(INFANTIL = ifelse(stringr::str_detect(education_level,"Infantil"),1,NA),
         FUNDAMENTAL = ifelse(stringr::str_detect(education_level,"Fundamental"),1,NA),
         MEDIO = ifelse(stringr::str_detect(education_level,"Ensino Médio"),1,NA))%>% 
  tidyr::pivot_longer(cols = c(INFANTIL, FUNDAMENTAL, MEDIO)) %>% 
  mutate(name = factor(name, 
                       levels = c("INFANTIL", "FUNDAMENTAL","MEDIO"),
                       labels = c("Educação Infantil", "Ensino Fundamental", "Ensino Médio"))) %>% 
  rename(etapa = name) %>% 
  # Remover escolas que não atendem Educação Infantil, Fundamental ou Médio
  filter(!is.na(value)) 

# Comando Facet do GGPLOT2:

# Atenção, trocar escola_muni por escola_muni_fed
ggplot(escola_muni_fed) + # Camada inicial: o apoio
 geom_sf(data = municipio)+ #segunda camada, o mapa do Brasil, que é um polígono
 geom_sf(size = 0.8, aes(color = government_level)) + # terceira camada a georreferência das escolas. Adicionar cores
 facet_wrap(~etapa) # separar mapas por tipo de rede escolar


# Reconfigurando o Gráfico:

theme_escola <- function(cor = "#0d4f64", ...){
  
  theme(panel.border=element_blank(),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        
        text=element_text(color="white"),
        axis.title = element_blank(),
        axis.text = element_blank(),
        plot.title=element_text(face="bold", size = 16),
        plot.subtitle = element_text(size = 12),
        plot.background = element_rect(fill=cor, color = cor),
        panel.background = element_rect(fill=cor),
        plot.margin  = margin(t=20, b=20, r=10, l=10),
        plot.caption = element_text(lineheight = 1.2),
        legend.background  = element_rect(fill = cor,
                                          color = cor),
        axis.ticks = element_blank(),
        legend.text = element_text(color = "white", face = "bold"),
        legend.title = element_text(face = "bold", size = 12),
        strip.text = element_text(face = "bold", size = 12),
        
        ...
  )
  
  
}


emap <- ggplot(escola_muni_fed) + # Camada inicial: o apoio
 geom_sf(data = municipio)+ #segunda camada, o mapa do Brasil, que é um polígono
 geom_sf(size = 0.8, aes(color = government_level)) + # terceira camada a georreferência das escolas. Adicionar cores
 facet_wrap(~etapa) + # separar mapas por tipo de rede escolar
 theme_escola() +
 #Adicionar cor manualmente aos pontos
 scale_color_manual(values = c("#4daf4a","#ff7f00","#e41a1c"))+
 #Aumentar o tamanho dos pontos da legenda
 guides(color = guide_legend(override.aes = list(size = 3)))+
 #Adicionar legendas
 labs(title = "Distribuição das escolas públicas no município de São Paulo/SP",
      caption = 'Produção: Daniel Castro | Fonte: INEP/MEC obtidos no pacote geobr (PEREIRA & GONÇALVES, 2022)',
      color = "Rede")


emap

# --------------------






