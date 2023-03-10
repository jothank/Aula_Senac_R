# Codigo do Registro
codigoCadastro = sample(x=1:100, size=4)

# Modelo
modelo <- c("Corolla", "Civic", "Golf", "Fiesta")

# Fabricante
fabricante <- c("Toyota", "Honda", "Volkswagen", "Ford")

# Ano
ano <- c(2017, 2018, 2019, 2016)

# Valor
valor <- c(25000, 27000, 22000, 18000)

#
revisado = "SIM"

# Criar data.frame com o cadastro
cadastro = data.frame(
	Cod = codigoCadastro,		# Codigo do registro
	Modelo = modelo,			# Modelo
	Fabricante = fabricante, 	# Fabricante
	Ano = ano,				# Ano
	Valor = valor 			# Valor
)

# Exibe os Dados
cadastro

nrow(cadastro) # Exibe a quantidade de linhas
ncol(cadastro) # Exibe a quantidade de colunas

cadastro$Modelo # Pega pelo nome Variavel que recebeu
cadastro[,4] # Pega a coluna
cadastro[,"Valor"]
cadastro[cadastro$Ano >= 2018, c("Cod","Modelo","Fabricante","Ano","Valor")]

# Exibe X linhas do Inicio da tabela
head(cadastro, n=2)
# Exibe X linhas do Final da tabela
tail(cadastro, n=2)

cadastro$Cor = NA
cadastro$Revisado = FALSE

cadastro

cadastro$Cor = NULL
cadastro
