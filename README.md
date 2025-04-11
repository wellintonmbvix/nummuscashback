# NummusCashback

O **NummusCashback** é uma aplicação desenvolvida em Delphi 11.3 que serve como ponte entre aplicativos locais e a API da Nummus, com o objetivo de realizar o controle de cashback em vendas de forma automatizada e flexível.

---

## 🚀 Objetivo

Integrar sistemas de frente de loja com a API da Nummus, possibilitando:

- Consulta de cashback disponível para um cliente.
- Registro de vendas para geração de cashback.
- Cancelamento de cashback.

---

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** Pascal
- **IDE:** Delphi 11.3

---

## ⚙️ Funcionamento

A aplicação é executada por linha de comando e utiliza dois arquivos de troca:

- `req.001`: arquivo de requisição, contendo os dados necessários para a operação.
- `resp.001`: arquivo de resposta gerado após o processamento.

### 📁 Local dos arquivos

Os arquivos devem estar localizados na pasta:

```text
C:\CashbackNummus\
```

### 🔧 Parâmetros obrigatórios da linha de comando:

- `-cashnummus`: **(obrigatório)** ativa o modo de operação com a API da Nummus.
- `-consultar`: realiza uma consulta de cashback disponível.
- `-postar`: registra uma venda para geração futura de cashback.
- `-cancelar`: cancela um cashback já registrado, informando seu `Id`.

---

## 📄 Layout do Arquivo `req.001`

```text
0|{api_key}|{client_id}
1|{nome_cliente}|{email_cliente}|{telefone_cliente}|{data_nascimento_cliente}|{gênero ("M","F","N/I")}|{cpf_cliente}
2|{nome_vendedor}|{email_vendedor}|{telefone_vendedor}|{data_nascimento_vendedor}|{gênero_vendedor}
3|{nome_produto}|{referência_produto}|{valor_venda}
4|{valor_total_venda}
9|{ticket_venda}|{cashback_utilizado}|{total_desconto}|{descrição_venda}|{data_venda}|{id_cashback_utilizado}|{descrição_cancelamento}
```

---

## 📄 Layout do Arquivo `resp.001`

```text
status_code: {200, 422 ou 500}
amount: {valor da quantia - para "-consultar"}
rescue_available: {cashback disponível - para "-consultar"}
id: {id do cashback gerado - para "-postar"}
message: {mensagem de erro - para status_code diferente de 200}
```

---

## 🧪 Exemplos de Uso

```bash
CashBackNummus.exe -cashnummus -consultar
CashBackNummus.exe -cashnummus -postar
CashBackNummus.exe -cashnummus -cancelar
```

---

## 👤 Autor

- **Nome:** Wellinton Mattos Brozeghini  
- **GitHub:** [wellintonmbvix](https://github.com/wellintonmbvix)  
- **E-mail:** wellinton.m.b.vix@gmail.com

---

## 📌 Observações

Este projeto não possui uma licença definida no momento.  
Caso tenha interesse em contribuir, entre em contato por e-mail.

---
