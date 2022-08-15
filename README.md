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

 <h1 id="modelagem-solucao">Modelagem da Solução</h1>
 
 <h1 id="desenvolvimento">Desenvolvimento</h1>
 
 <h2 id="preparacao">Modelagem da Solução</h2>
 Primeiro foi feito o download de todos os arquivos e eles foram salvos nas seguintes pastas
 ./resources/tides*
 ./resources/waves*

* Nota: Os arquivos .csv foram adicionados no .gitignore para evitar o envio para o GitHub.

Em seguida, foram unidos todos os arquivos em 1 só, para facilitar o carregamento e a utilização, utilizando o código a seguir:

```
awk '(NR == 1) || (FNR > 1)' ./resources/*.csv > ./resources/final/all_tide_data.csv
```

Feito importamos o dado para uma tabela do BigQuery
```
gsutil cp ./resources/final/all_tide_data.csv gs://case-estagio/dadosfera/
```
Depois importamos para uma tabela no BigQuery

```
bq load --source_format=CSV --skip_leading_rows=1 --replace=true dadosfera.all_tide_data gs://case-estagio/dadosfera/all_tide_data.csv
```

Após os dados carregados como mostrado na imagem abaixo:
![](images/tide_data.png)

 <h2 id="queries">Queries</h2>
 As queries abaixo foram utilizadas para responder as questões 1 e 2
(Link para as queries)Query 1
(link para as queries) Query 2


Sendo os resultados encontrados mostrados abaixo:

1 - Resposta para Questão 1

2 - Resposta para Questão 2


 
 <h2 id="correlation">Correlação</h2>

 <h1 id="bonus">Bonus</h1>