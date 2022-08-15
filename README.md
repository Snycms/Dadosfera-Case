# **Solução do case de estágio** 


# Index
 1. [Visão Geral](#visao-geral)
 2. [Modelagem Solução](#modelagem-solucao) 
 3. [Desenvolvimento](#desenvolvimento)
 3.1. [Preparaçao dos dados](#preparacao)
 3.2. [Queries](#queries)
 3.3  [Wave lengh Correlation](#correlation)
 4. [Item Bonus](#bonus)

 <h1 id="visao-geral">Visão Geral</h1>

 <h1 id="preparacao-dados">Preparação dos dados</h1>

 Primeiro foi feito o download de todos os arquivos e eles foram salvos nas seguintes pastas
 ```
 ./resources/tides*
 ./resources/waves*
```
* Nota: Os arquivos .csv foram adicionados no .gitignore para evitar o envio para o GitHub.


Em seguida, foram unidos todos os arquivos em 1 só, para facilitar o carregamento e a utilização, utilizando o código a seguir:

```
awk '(NR == 1) || (FNR > 1)' ./resources/*.csv > ./resources/final/tide_data.csv
```

Feito importamos o dado para uma tabela do BigQuery
```
gsutil cp ./resources/final/tide_data.csv gs://case-estagio/dadosfera/
```
Depois importamos para uma tabela no BigQuery

```
bq load --source_format=CSV --skip_leading_rows=1 --replace=true dadosfera.tide_data gs://case-estagio/dadosfera/tide_data.csv
```
* O mesmo procedimento foi realizado para os dados de waves

Após os dados carregados, iremos utilizar as tabelas para realização das consultas SQL, como mostrado na imagem abaixo:
![](Images/tide_data.png)
Tide table

![](Images/waves_data.png)

Waves table

 <h1 id="desenvolvimento">Desenvolvimento</h1>
 

 <h2 id="queries">Queries</h2>
 As queries abaixo foram utilizadas para responder as questões 1 e 2

[Query 1 - Lowest Temperature](queries/lowest_temperature_per_bouys.sql)

[Query 2 - Biggest Water Level](queries/lat_long_biggest_water_level.sql)


Sendo os resultados encontrados mostrados abaixo:
 <h4 id="resultados-1">Resultados Questões 1</h4>

![](Images/query_biggest_water_level.png)

```
O maior nível de água acontece na latitude = `53.585` e longitude = `-6.1081` no mês de Fevereiro.
``` 
  <h4 id="resultados-2">Resultados Questões 2</h4>

![](Images/query_lowest_temperature.png)

```
A menor temperatura para cada uma das regiões é mostrada na imagem acima, e todas elas são no mês de Agosto.
```

 
 <h2 id="correlation">Correlação</h2>

 <h1 id="bonus">Bonus</h1>