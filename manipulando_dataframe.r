# Codigo do Registro
codigoCadastro = 1L:4L

# Modelo
modelo <- c("Corolla", "Civic", "Golf", "Fiesta")

# Fabricante
fabricante <- c("Toyota", "Honda", "Volkswagen", "Ford")

# Ano
ano <- c(2017, 2018, 2019, 2016)

# Valor
valor <- c(25000, 27000, 22000, 18000)

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

nrow(cadastro)
ncol(cadastro)

cadastro$Modelo # Pega pelo nome Variavel que recebeu
cadastro[,4] # Pega a coluna
cadastro[,"Valor"]
cadastro[cadastro$Ano >= 2018, c("Cod","Modelo","Fabricante","Ano","Valor")]
