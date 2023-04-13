sum(1:5)
# [1] 15
median(1:5)
#[1] 3
sum(1, 2, 3, 4, 5)
#[1] 15
median(1, 2, 3, 4, 5) 
#[1] 1
c(2, 3, 5, 7, 11, 13) - 2 
#[1]  0  1  3  5  9 11
c(2, 3, 5, 7, 11, 13) - 2 
#[1]  0  1  3  5  9 11
identical(2 ^ 3, 2 ** 3) 
#[1] TRUE
1:10 / 3 
# [1] 0.3333333 0.6666667 1.0000000 1.3333333 1.6666667 2.0000000 2.3333333 2.6666667 3.0000000 3.3333333
1:10 %/% 3
# [1] 0 0 1 1 1 2 2 2 3 3
1:10 %% 3 
# [1] 1 2 0 1 2 0 1 2 0 1
factorial(7) + factorial(1) - 71 ^ 2
# [1] 0
choose(5, 0:5)
# [1]  1  5 10 10  5  1
c(3, 4 - 1, 1 + 1 + 1) == 3 
# [1] TRUE TRUE TRUE
1:3 != 3:1
# [1]  TRUE FALSE  TRUE
exp(1:5) < 100
#[1]  TRUE  TRUE  TRUE  TRUE FALSE
(1:5) ^ 2 >= 16
# [1] FALSE FALSE FALSE  TRUE  TRUE
sqrt(2) ^ 2 == 2
# [1] FALSE
sqrt(2) ^ 2 - 2
# [1] 4.440892e-16
c("Can", "you", "can", "a", "can", "as", "a", "canner", "can", "can", "a", "can?") == "can"
# [1] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
c("A", "B", "C", "D") < "C"
# [1]  TRUE  TRUE FALSE FALSE
c("a", "b", "c", "d") < "C"
# [1]  TRUE  TRUE  TRUE FALSE
# gerando um factor
(gender <- factor(c("male", "female", "female", "male", "female")))
#  male   female female male   female
# Levels: female male
gender
# [1] male   female female male   female
# Levels: female male
levels(gender)
# [1] "female" "male"  



# usando for :
ulams_spiral <- c(1, 8, 23, 46, 77)
for(i in ulams_spiral) i
for(i in ulams_spiral) print(i)


# vetores

8.5:4.5

# valores concatenados:
c(1, 1:3, c(5, 8), 13)

# definindo o tipo do vetor:
vector("numeric", 5)
vector("complex", 5)
vector("logical", 5)
vector("character", 5)
vector("list", 5)

# gerando sequencia:
seq.int(3, 12)
seq.int(0.1, 0.01, -0.1)

# sequencia e for:
pp <- c("Peter", "Piper", "picked", "a", "peck", "of", "pickled", "peppers")
for(i in seq_along(pp)) print(pp[i])



# verificando tamanhos:
length(1:5)
sn <- c("Sheena", "leads", "Sheila", "needs")
length(sn)


# -------------------------------------------------------------
# atribuindo nomes aos indices de vetores:

c(apple = 1, banana = 2, "kiwi fruit" = 3, 4)

x <- 1:4
names(x) <- c("apple", "bananas", "kiwi fruit", "")

# ----------------------------------------------------------

# ------------ creating um Array :

(three_d_array <- array(
  1:24,
  dim = c(4, 3, 2),
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei"),
    c("un", "deux")
  )
))

# ------------------------------


# ------------ creating matrix:

(a_matrix <- matrix(
  1:12,
  nrow = 4, #ncol = 3 works the same
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei")
  )
))

# -----------------------------

# linhas , colunas e dimensões de matrizes:

dim(three_d_array)
dim(a_matrix)

nrow(a_matrix)
ncol(a_matrix)
length(three_d_array)

rownames(a_matrix)
colnames (a_matrix)


# ------------------------------- Listas e dataframes:

(a_list <- list(
  c(1, 1, 2, 5, 14, 42), 
  month.abb,
  matrix(c(3, -8, 1, -3), nrow = 2),
  asin
))


# ------------
names(a_list) <- c("catalan", "months", "involutary", "arcsin")
a_list


# --------------- dataframes:
(a_data_frame <- data.frame(
  x = letters[1:5],
  y = rnorm(5),
  z = runif(5) > 0.5
))
class(a_data_frame)


# -------------- criando funções:
hypotenuse <- function(x, y)
{
  sqrt(x ^ 2 + y ^ 2)
}
hypotenuse(3,6)


# ---------------- fim da criação de funções
# Formatando Números:
pow <- 1:3
(powers_of_e <- exp(pow))
formatC(powers_of_e)
formatC(powers_of_e, digits = 3)
formatC(powers_of_e, digits = 3, width = 10)
formatC(powers_of_e, digits = 3, format = "e")
formatC(powers_of_e, digits = 3, flag = "+") 
sprintf("%s %d = %f", "Euler's constant to the power", pow, powers_of_e)
sprintf("To three decimal places, e ^ %d = %.3f", pow, powers_of_e)
sprintf("In scientific notation, e ^ %d = %e", pow, powers_of_e)

# ----------------- criando fatores:

(heights <- data.frame(
  height_cm = c(153, 181, 150, 172, 165, 149, 174, 169, 198, 163),
  gender = c(
    "female", "male", "female", "male", "male",
    "female", "female", "male", "male", "female"
  )
))

class(heights$gender)
heights$gender
heights$gender[1] <- "Female"
heights$gender
levels(heights$gender)
nlevels(heights$gender)

# Convertendo variaveis continuas para variaveis categoricas:
ages <- 16 + 50 * rbeta(10000, 2, 3)
grouped_ages <- cut(ages, seq.int(16, 66, 10))
head(grouped_ages)
table(grouped_ages)
class(ages)
class(grouped_ages)


#### ---------------------------------------------------------------------------------------------
#### Controle de fluxos e loop
#### ---------------------------------------------------------------------------------------------

## if and else:
if(TRUE) message("It was true!")
if(FALSE) message("It wasn't true!")



x <- 3
if(x > 2)
{
  y <- 2 * x
  z <- 3 * y
}

if(FALSE)
{
  message("This won't execute...")
}else
{
  message("and you'll get an error before you reach this.")
}




# ----------
(r <- round(rnorm(2), 1))

(x <- r[1] / r[2])

if(is.nan(x))
{
  message("x is missing")
} else if(is.infinite(x))
{
  message("x is infinite")
} else if(x > 0)
{
  message("x is positive")
} else if(x < 0)
{
  message("x is negative")
} else
{
  message("x is zero")
}

# ------------------

x <- sqrt(-1 + 0i)
(reality <- if(Re(x) == 0) "real" else "imaginary")

# --------------- switch case:
(greek <- switch(
  "gamma",
  alpha = 1,
  beta = sqrt(4),
  gamma =
    {
      a <- sin(pi / 3)
      4 * a ^ 2
    }
))

################

################# LOOP
# repeat:

repeat
{
  message("Happy Groundhog Day!")
}

# ---------
repeat
{
  message("Happy Groundhog Day!")
  action <- sample(
    c(
      "Learn French",
      "Make an ice statue",
      "Rob a bank",
      "Win heart of Andie McDowell"
    ),
    1
  )
  message("action = ", action)
  if(action == "Win heart of Andie McDowell") break
}

# ----------

repeat
{
  message("Happy Groundhog Day!")
  action <- sample(
    c(
      "Learn French",
      "Make an ice statue",
      "Rob a bank",
      "Win heart of Andie McDowell"
    ),
    1
  )
  if(action == "Rob a bank")
  {
    message("Quietly skipping to the next iteration")
    next
  }
  message("action = ", action)
  if(action == "Win heart of Andie McDowell") break
}

### ---------------------------------------------------------------
### While :

action <- sample(
  c(
    "Learn French",
    "Make an ice statue",
    "Rob a bank",
    "Win heart of Andie McDowell"
  ),
  1
)

# ----

while(action != "Win heart of Andie McDowell")
{
  message("Happy Groundhog Day!")
  action <- sample(
    c(
      "Learn French",
      "Make an ice statue",
      "Rob a bank",
      "Win heart of Andie McDowell"
    ),
    1
  )
  message("action = ", action)
}

# ------------------- FOR :

for(i in 1:5) message("i = ", i)

for(i in 1:5)
{
  j <- i ^ 2
  message("j = ", j)
}

# For in list

l <- list(
  pi,
  LETTERS[1:5],
  charToRaw("not as complicated as it looks"),
  list(
    TRUE
  )
)

for(i in l)
{
  print(i)
}


# ---------
# ---------------------------------------------

## *****************************************************************************************
# parsing dates

moon_landings_str <- c(
  "20:17:40 20/07/1969",
  "06:54:35 19/11/1969",
  "09:18:11 05/02/1971",
  "22:16:29 30/07/1971",
  "02:23:35 21/04/1972",
  "19:54:57 11/12/1972"
)

(moon_landings_lt <- strptime(
  moon_landings_str,
  "%H:%M:%S %d/%m/%Y",
  tz = "UTC"
))

strptime(
  moon_landings_str,
  "%H:%M:%S %d-%m-%Y",
  tz = "UTC"
)

# ------ visualizando os datasets ::::::::::::::
data()


# -------------------------------------------------
# Lendo XML 

install.packages("XML")
library(XML)
xml_file <- system.file("extdata", "options.xml", package = "learningr")
r_options <- xmlParse(xml_file)

# --------- Arquivos JSON:
install.packages("RJSONIO")
install.packages("rjson")
library(RJSONIO)
library(rjson)

jamaican_city_file <- system.file(
  "extdata",
  "Jamaican Cities.json",
  package = "learningr"
)

(jamaican_cities_RJSONIO <- RJSONIO::fromJSON(jamaican_city_file))

(jamaican_cities_rjson <- rjson::fromJSON(file = jamaican_city_file))


# --- LENDO DADOS WEB:

install.packages("WDI")
library(WDI)
wdi_datasets <- WDIsearch()
head(wdi_datasets)


wdi_trade_in_services <- WDI(
  indicator = "BG.GSR.NFSV.GD.ZS"
)

str(wdi_trade_in_services)



############################
# transformando dados com dplyr -->
############################

library(nycflights13)
library(tidyverse)

flights

### Filtrando linhas:
filter(flights, month == 1, day == 1)

jan1 <- filter(flights, month == 1, day == 1)
jan1

(dec25 <- filter(flights, month == 12, day == 25))


## Comparações:

filter(flights, month == 11 | month == 12)

nov_dec <- filter(flights, month %in% c(11, 12))
nov_dec


filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, !(arr_delay > 120 | dep_delay > 120))


## Usando Arrange, para trabalar com linhas:, é similar ao filter só que trabalh com linhas:
arrange(flights, year, month, day)
arrange(flights, desc(arr_delay))

# --
df <- tibble(x = c(5, 2, NA))

arrange(df, x)
arrange(df, desc(x))


##-- Selecionando Colunas com select():
select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))

rename(flights, tail_num = tailnum)

select(flights, time_hour, air_time, everything())

##  Adicionando novas variaveis:
flights_sml <- select(flights,year:day, ends_with("delay"),distance,air_time)

mutate(flights_sml,gain = arr_delay - dep_delay,speed = distance / air_time * 60)


mutate(flights_sml, gain = arr_delay - dep_delay, hours = air_time / 60, gain_per_hour = gain / hours)   

