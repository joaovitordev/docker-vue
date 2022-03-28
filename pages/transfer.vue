<template>
  <div style="margin: 16px">
    <input type="text" placeholder="Chave pix" v-model="key" />

    <input
      type="number"
      placeholder="Valor da transferência"
      v-model="amount"
    />

    <button v-on:click="transact()">cadastrar</button>
  </div>
</template>

<script>
import gql from 'graphql-tag';

export default {
  mounted() {
    if (process.client) {
      const accessToken = localStorage.getItem("access_token");

      if (!accessToken) {
        window.location = '/user';
      }
    }
  },

  data() {
    return {
      key: '',
      amount: null,
    };
  },

  methods: {
    transact() {
      this.$apollo
        .mutate({
          mutation: gql`
            mutation ($input: TransactionInput) {
              transact(input: $input) {
                to
                from
                amount
              }
            }
          `,
          variables: {
            input: {
              from: localStorage.getItem('key'),
              to: this.key,
              amount: parseFloat(this.amount),
            },
          },
        })
        .then(_ => {
          alert('Transferência concluída');
          window.location = '/';
        })
        .catch((result) => {
          alert(result.message);
        });
    },
  },
};
</script>

<style scoped>
input[type="text"],
input[type="number"] {
  background-color: #272727;
  color: white;
  width: 100%;
  height: 44px;
  border-radius: 5px;
  padding: 16px;
  margin-bottom: 16px;
}

body {
  background-color: #17181c;
}
</style>
