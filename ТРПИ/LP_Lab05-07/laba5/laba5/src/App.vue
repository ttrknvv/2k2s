<template>

    <body>  
        <MyHeader></MyHeader>
        <main>
            <SectionHero></SectionHero>
            <SectionEpisodes></SectionEpisodes>
            <SectionAbout></SectionAbout>
            <SectionSubscribes></SectionSubscribes>
            <SectionAddReview @add-card="addCard"></SectionAddReview>
            <SectionCards v-bind:cards="cards"></SectionCards>
        </main>
        <MyFooter></MyFooter>
    </body>

</template>

<script>

import MyHeader from './components/MyHeader.vue'
import SectionHero from './components/SectionHero.vue'
import SectionEpisodes from './components/SectionEpisodes.vue'
import SectionAbout from '@/components/SectionAbout.vue'
import SectionSubscribes from '@/components/SectionSubscribes.vue'
import SectionAddReview from '@/components/SectionAddReview.vue'
import SectionCards from '@/components/SectionCards.vue'
import MyFooter from './components/MyFooter.vue'

export default 
{
    name: 'App',
    components: 
    {
        MyHeader,
        SectionHero,
        SectionEpisodes,
        SectionAbout,
        SectionSubscribes,
        SectionAddReview,
        SectionCards,
        MyFooter
    },

    data() {
        return {
            cards: [
                {id: 1, body: "I can't recommend this podcast enough", name: "Betty Lacey", starsCount: 3},
                {id: 2, body: "Jacob is the best in the business", name: "Adam Driver", starsCount: 5},
                {id: 3, body: "A wealth of audio knowledge", name: "Marcus Brown", starsCount: 5},
                {id: 4, body: "Every episode is a gem!", name: "Jessica Knowl", starsCount: 5},
                {id: 5, body: "Whoa whoa, let me take some notes!", name: "Scott Adams", starsCount: 5},
                {id: 6, body: "I've upped my game considerably since I started listening", name: "Steven Blast", starsCount: 1}
            ]
        }
    },

    methods: {
        addCard(card){
            this.cards.push(card)
        }
    }
}

</script>

<style>

:root {
    --white: #ffffff;
    --black: #000000;
    --accent: #118da8;
}
html {
    box-sizing: border-box;
    height: 100%;
    scroll-behavior: smooth;
    overflow-x: hidden !important;
}
*,
*::before,
*::after {
    box-sizing: inherit;
}
*:focus {
    outline: 2px dotted var(--accent);
    outline-offset: 3px;
}
::-webkit-scrollbar {
    width: 0.3em;
}
::-webkit-scrollbar-thumb {
    background-color: var(--accent);
    outline: 1px solid slategrey;
}
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgb(0 0 0 / 30%);
}
::selection {
    background-color: var(--accent);
    color: var(--white);
}
::-moz-selection {
    background-color: var(--accent);
    color: var(--white);
}
body {
    display: flex;
    flex-direction: column;
    height: 100%;
    padding: 0;
    margin: 0;
    font-family: "DM Sans", "Arial", sans-serif;
    background-color: #191919;
    color: var(--white);
    font-weight: 400;
    font-size: 22px;
    line-height: 33px;
}
img {
    max-width: 100%;
    height: auto;
}
a {
    text-decoration: none;
}
.container {
    max-width: 1400px;
    padding-left: 30px;
    padding-right: 30px;
    margin-left: auto;
    margin-right: auto;
}

</style>