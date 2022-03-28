<template>
  <div>
    <button v-on:click="logout()">deslogar</button>
    <div class="card-header">
      <h1>Olá, <span class="text-primary">{{ name }}</span></h1>
      <p>Saldo disponível</p>
      <small class="saldo">R$ {{ amount }}</small>
    </div>

    <!-- <h2>Histórico de transações</h2> -->

    <!-- <div>
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
    </div> -->

    <NuxtLink to="/transfer">
      <v-btn color="success" fab x-large dark class="btn-fab">
        <v-icon>mdi-currency-usd</v-icon>
      </v-btn>
    </NuxtLink>
  </div>
</template>

<script>
import gql from "graphql-tag";

export default {
  data() {
    return {
      name: '',
      key: '',
      amount: 0,
    }
  },

  methods: {
    logout() {
      localStorage.clear();
      window.location = '/user'
    }
  },

  mounted() {
    
    if (process.client) {
      const accessToken = localStorage.getItem('access_token');
      
      if (!accessToken) {
        window.location = '/user';
      }
      
      this.$apollo
        .query({
          query: gql`
            query ($accessToken: String) {
              getUser(accessToken: $accessToken) {
                name
                key
                accessToken
                wallet {
                  amount
                }
              }
            }
          `,
          variables: {
            accessToken: accessToken,
          },
        })
        .then((result) => {
          const user = result.data.getUser;

          this.name = user.name;
          this.key = user.key;
          this.amount = user.wallet.amount;
        });
    }

    // if (!process.client) return;

    // if (!localStorage.getItem("access_token")) {
    //   window.location = "/user";
    // }
  },

  name: "IndexPage",
};
</script>


<style>
body {
  background-color: #17181c;
  color: #00d984;
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
  color: #00d984;
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
  color: #00d984;
}
</style>
