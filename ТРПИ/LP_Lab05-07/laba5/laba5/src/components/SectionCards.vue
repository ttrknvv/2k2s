<template>
    <section class="cards">
        <div class="container">
            <div class="cards-box">
                <div class="card-item" v-for="(card, id) in cards" v-bind:key="id">
                    <div class="stars">
                        <img v-for="index in card.starsCount" v-bind:key="index" src="@/img/star.svg" alt="Star Icon">
                    </div>
                    <h2>{{ card.body }}</h2>
                    <p>{{ card.name }}</p>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    props: {
        cards: {
            type: Array
        }
    }
}
</script>

<style>

.cards-box {
    display: grid;
    grid-template-columns: auto auto auto;
    justify-content: space-between;
    gap: 20px;
}
.card-item {
    background-color: var(--black);
    border-radius: 32px;
    padding: 55px;
}
.card-item h2 {
    font-weight: 400;
    font-size: 36px;
    line-height: 43px;
    margin: 20px 0px;
}
.card-item p {
    font-weight: 400;
    font-size: 24px;
    line-height: 29px;
    color: rgba(255, 255, 255, 0.7);
}
</style>