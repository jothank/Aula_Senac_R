# Codigo do Registro
codigoCadastro = 1L:6L

# Nome
nomeCadastro = c("Pablo Nogueira","Felipe Moraes","Tertuliano Carvalho","Miguel Macedo","Davi Melo","Washington Santos")

# Data Nascimento
nascimentoCadastro = as.Date(c("1940-10-23","1960-03-21","1873-07-20","1980-07-20","1927-01-25","1907-12-15"))

# Criar data.frame com o cadastro
cadastro = data.frame(
	Cod = codigoCadastro,		# Codigo do registro
	Nome = nomeCadastro,		# Nome
	Nasc = nascimentoCadastro	# Data de Nascimento
)

# Exibe os Dados
cadastro
