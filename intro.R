# 1. VARIABLES
edad <- 25
sexo = "Masculino"

salario_x = 1000
salario_y = 1200

### operaciones matematicas
10 + 10
10 - 100
10*10
10/1000
10^3

### operaciones tricotomia
10 > 1
10 < 5
10 == 10

### operaciones logicas
edad <- 17
sexo = 'Masculino'

edad > 18 & sexo == 'Masculino' #ambos argumentos sean TRUE
edad > 18 || sexo == 'Masculino' #al menos un argumento sea TRUE

# 2. CONDICIONALES
edad <- 15

### ejemplo 1
if(edad >= 18){
  print('Puedes acceder')
}else{
  print('no tienes edad suficiente para acceder')
}

### ejemplo 2
amigos <- 4
num_rebanadas <- 8
if(num_rebanadas%%amigos == 0){
  print('es suficiente con ese numero de pizzas')
}else{
  print('pide mas pizza')
}

# 3. ESTRUCTURAS SIMPLES DE DATOS
c(1:100)

edades <- c(22,25,23,21,21,23,27,28,31,12,14,29)
length(edades)
min(edades)
max(edades)
range(edades)
diff(range(edades))
mean(edades)
var(edades)
sd(edades)

# 4. CICLOS

### ejemplo 1
contador <- 0
for(edad in edades){
  contador = contador + (mean(edades)-edad)^2
}
contador = contador/(length(edades)-1)

### ejemplo 2
edades <- c(17,18,19,12,20)
for(e in edades){
  if(e >= 18){
    print(paste("tu edad:",e,"es suficiente"))
  }else{
    print(paste("te faltan",18-e,"años para entrar"))
  }
}

# 5. BASES DE DATOS

### ejemplo 1
edades <- c(25,19,26,24)
sexo <- c('M','F','F','M')
salario <- c(12000,5000,10000,10500)

muestreo <- data.frame(
  EDAD = edades,
  SEXO = sexo,
  SALARIO = salario
)

mean(muestreo$EDAD)
sd(muestreo$EDAD)

mean(muestreo$SALARIO)

### tablas
table(muestreo)
table(muestreo$SEXO,muestreo$EDAD)

### ejemplo 2
edades_simu <- rnorm(10000,mean=23.5,sd=3.11)
salario_simu <- rnorm(10000,mean=mean(muestreo$SALARIO),sd=sd(muestreo$SALARIO))

SIMU <- data.frame(
  EDADs = edades_simu,
  SALARIOs = salario_simu
)

## 5.A DPLYR

# 6. ESTADÍSTICA

muestreo <- data.frame(
  'edad' = c(12,15,39,67,40,41,56,21,27,31,29)
)

M <- mean(muestreo$edad)
S <- sd(muestreo$edad)

plot(muestreo$edad)
plot(sort(muestreo$edad))

simulacion <- rnorm(1000,mean=M,sd=S)

plot(simulacion)
plot(sort(simulacion))

quantile(muestreo$edad, .95)
diff(range(muestreo$edad))

## distribuciones de probabilidad

runif()
rexp()
rgamma()
rbeta()
rpois()

as.integer(runif(1,min=10,max=65))

# 7. GRÁFICAS

plot(simulacion)

hist(simulacion)

boxplot(simulacion)

muestreo <- data.frame(
  'edad' = c(21,24,27,29,35,62,71),
  'salario' = c(5600,6200,7800,6800,8000,12000,14000)
)

plot(muestreo$edad,muestreo$salario)

cor(muestreo$edad,muestreo$salario)

## 7.A GGPLOT2
library(ggplot2)

ggplot(muestreo, aes(x = edad, y = salario)) +
  geom_point() +
  theme_bw() +
  labs(title = "Scatter plot of Wage against Age", x = "Edad de la Población", y = "Salario")

# 8. REGRESIONES

modelo <- lm(data = muestreo, salario ~ edad)
summary(modelo)

ggplot(muestreo, aes(x = edad, y = salario)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") + 
  theme_bw() +
  labs(title = "Scatter plot of Wage against Age", x = "Edad de la Población", y = "Salario")

confint(modelo)

## 8.A Regresiones Multiples

# 9. CLASIFICACIONES

# 10. SERIES DE TIEMPO
