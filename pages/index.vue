<template>
 <div>
    <div class="card-header">
      <h1>Olá, <span class="text-primary">João Vitor</span></h1>
      <p>Saldo disponível</p>
      <small class="saldo">R$ 3500,45</small>
    </div>

    <h2>Histórico de transações</h2>

    <div>
      <div class="card-tranfer">
        <p class="tranfer-money-send">560,00</p>
        <p class="transfer-user">transferência enviada para Gustavo</p>
      </div>
      <div class="card-tranfer">
        <p class="tranfer-money-received">560,00</p>
        <p class="transfer-user">transferência recebida de Gustavo</p>
      </div>
      <div class="card-tranfer">
        <p class="tranfer-money-send">560,00</p>
        <p class="transfer-user">transferência enviada para Gustavo</p>
      </div>
      <div class="card-tranfer">
        <p class="tranfer-money-received">560,00</p>
        <p class="transfer-user">transferência recebida de Gustavo</p>
      </div>
    </div>

    <NuxtLink to="/transfer">
      <v-btn color="success" fab x-large dark class="btn-fab">
        <v-icon>mdi-currency-usd</v-icon>
      </v-btn>
    </NuxtLink>

  </div>
</template>

<script>
 import gql from 'graphql-tag'
    export default {
    name: 'IndexPage',
    apollo: {
        characters: gql`
            query getCharacters {
            characters {
                results {
                    id
                    name
                    status
                }
            }
        }`
      }
    }
</script>


<style>
  body {
    background-color: #17181C;
    color: #00D984;
    font-family: Arial, Helvetica, sans-serif;
    height: 100vh;
  }

  .btn-fab {
    right: 16px;
    bottom: 16px;
    position: absolute;
  }

  .card-header {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    align-content: center;
    padding: 16px;
    background-color: #272727;
    border-radius: 5px;
    margin: 16px;
    margin-bottom: 32px;
  }

  .card-tranfer {
    margin: 16px;
    padding: 16px;
    border-radius: 5px;
    background-color: #272727;
    margin-bottom: 16px;
  }

  .tranfer-money-received {
    color: #00D984;
    font-size: 18px;
    font-weight: 600;
  }

    .tranfer-money-send {
      color: #ff3838;
      font-size: 18px;
      font-weight: 600;
  }

  p {
    color: #fff;
    margin-bottom: 4px;
  }

  h1 {
    color: #fff;
    margin-bottom: 16px;
  }

  h2 {
    margin: 16px;
    font-size: 18px;
    color: #fff;
    text-align: center;
  }

  small {
    font-size: 32px;
    font-weight: 600;
  }

  .text-primary {
    color: #00D984;
  }
</style>
