<template>
    <section class="addReview">
        <div class="container">
          <div class="addReview-box">
            <div class="addReview-left">
                <h2>Add your review</h2>
            </div>
            <div class="addReview-form">
                <form class="subscribe-form" @submit.prevent="onSubmit">
                    <input type="name" name="name" placeholder="Name" v-model="name" required>
                    <input type="name" name="review" placeholder="Your review" v-model="body" required>
                    <p><select size="1" name="hero" v-model="starsCount">
                        <option disabled selected>Rate:</option>
                        <option value="1">1 star</option>
                        <option value="2">2 stars</option>
                        <option value="3">3 stars</option>
                        <option value="4">4 stars</option>
                        <option value="5">5 stars</option>
                    </select></p>
                    <button type="submit">Submit</button>
                </form>
            </div>
          </div>
            
        </div>
    </section>
</template>

<script>
export default {
    methods: {
      onSubmit() {
        if (this.name.trim() && this.body.trim()) {
          const newCard = {
            id: Date.now(),
            name: this.name,
            body: this.body,
            starsCount: this.starsCount - 0,
            completed: false
          }

          this.$emit('add-card', newCard)
        }
      }
    }
}
</script>

<style scoped>

.addReview {
  margin: 200px 0px;
}
.container {
  background-color: var(--black);
  border-radius: 32px;
  display: flex;
  flex-direction: column;;
  justify-content: space-between;
  align-items: center;
  padding: 40px;
}
.addReview-box {
  background-color: var(--black);
  border-radius: 32px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding: 60px;
}


.addReview-form {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

.addReview-form input {
  height: auto;
  background: #191919;
  border: 1px solid #191919;
  color: var(--white);
  border-radius: 6px;
  padding: 19px 26px;
  margin-bottom: 20px;
  outline: none;
}

.addReview-form input:focus {
  border: 1px solid var(--accent);
}

.addReview-form button {
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

.addReview-form button:hover,
.addReview-form button:focus {
  background-color: transparent;
  color: var(--accent);
}
.addReview-form button:active {
  opacity: 0.7;
}

.addReview-left h2 {
  width: 431px;
  font-weight: 400;
  font-size: 72px;
  line-height: 79px;
  letter-spacing: 2.88px;
  margin-top: 0;
  margin-bottom: 0;
}

option {
  background-color: #191919;
  color: rgba(255, 255, 255, 0.7);
}

select {
  background-color: #191919;
  width: 100px;
  margin-bottom: 20px;
  border-radius: 6px;
  border: #191919;
  color: rgba(255, 255, 255, 0.7);
}

</style>