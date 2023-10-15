<template>
    <section class="subscribe">
        <div class="container">
            <div class="subscribe-box">
                <div class="subscribe-left">
                    <span>Email Newsletter</span>
                    <h2>Subscribe for updates</h2>
                </div>
                <div class="subscribe-right">
                    <form class="subscribe-form">
                        <input type="name" name="name" placeholder="Name" v-model="this.subs.name" required>
                        <input type="email" name="email" placeholder="Email" v-model="this.subs.email" required>
                        <button type="button" v-on:click="checkData()">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default ({
  name : "SectionSubscribes",
  data() {
    return {
        subs : {
          email : "",
          name : ""
        }
    }
  },
  methods: {
    checkData() {
      let validator = /^(([^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/iu;
      if(!validator.test(this.subs.email) || this.subs.name === "") {
        alert("Неправильно введен email или проверьте имя!");
        return;
      }
      else {
        alert("Вы подписались!");
        this.email = "";
        this.name = "";
        scroll(0, 0);
      }
    }
  }
})
</script>


<style>

.subscribe {
  margin: 200px 0px;
}
.subscribe-box {
  background-color: var(--black);
  border-radius: 32px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 60px;
}
.subscribe-left span {
  font-weight: 400;
  font-size: 18px;
  line-height: 27px;
  color: var(--accent);
  margin-top: 0;
  margin-bottom: 0;
}
.subscribe-left h2 {
  width: 431px;
  font-weight: 400;
  font-size: 72px;
  line-height: 79px;
  letter-spacing: 2.88px;
  margin-top: 0;
  margin-bottom: 0;
}
.subscribe-form {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}
.subscribe-form input {
  width: 522px;
  height: auto;
  background: #191919;
  border: 1px solid #191919;
  color: var(--white);
  border-radius: 6px;
  padding: 19px 26px;
  margin-bottom: 20px;
  outline: none;
}
.subscribe-form input:focus {
  border: 1px solid var(--accent);
}
.subscribe-form button {
  background-color: var(--accent);
  border: 1px solid var(--accent);
  border-radius: 6px;
  padding: 10px 20px;
  cursor: pointer;
  font-weight: 700;
  font-size: 15px;
  line-height: 29px;
  color: rgba(255, 255, 255, 0.7);
  transition: all 0.3s ease;
}
.subscribe-form button:hover,
.subscribe-form button:focus {
  background-color: transparent;
  color: var(--accent);
}
.subscribe-form button:active {
  opacity: 0.7;
}

</style>