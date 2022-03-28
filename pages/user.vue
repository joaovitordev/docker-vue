<template>
  <div>
    <input type="text" v-model="fullname" placeholder="nome" />
    <br />
    <input type="text" v-model="key" placeholder="chave pix" />

    <br />

    <button type="button" v-on:click="create()">cadastrar</button>
  </div>
</template>

<script>
import gql from 'graphql-tag';

export default {
  data() {
    return {
      fullname: '',
      key: '',
    };
  },
  methods: {
    create() {
      this.$apollo.mutate({
        mutation: gql`
          mutation ($input: UserInput) {
            createUser(input: $input) {
              accessToken
              key
            }
          }
        `,
        variables: {
          input: {
              name: this.fullname,
              key: this.key,
          }
        },
      }).then(result => {
          localStorage.setItem('access_token', result.data.createUser.accessToken);
          localStorage.setItem('key', result.data.createUser.key);
          window.location = '/';
      })
    },
  },
};
</script>

<style>
</style>