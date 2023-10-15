<template>
    <section class="about">
        <div class="container">
            <div class="about-box">
                <div class="about-left">
                    <img src="@/img/arrow-right.png" alt="Arrow right icon with circle">
                    <p class="about-left-title">Meet your host</p>
                    <h2>Jacob Paulaner</h2>
                    <p class="about-left-text">Jacob has a background in audio engineering, and has been podcasting since the early days.</p>
                    <p class="about-left-text">He's here to help you level up your game by sharing everything he's learned along the way.</p>
                </div>
                <div class="about-right">
                    <img src="@/img/about-img.jpg" alt="About Image" srcset="@/img/about-img.jpg 1x, @/img/about-img@2x.jpg 2x">
                </div>
            </div>
        </div>
    </section>
</template>

<style>

.about-box {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}
.about-left .about-left-title {
    font-weight: 400;
    font-size: 18px;
    line-height: 27px;
    color: var(--accent);
    margin-top: 0;
    margin-bottom: 0;
}
.about-left h2 {
    font-weight: 400;
    font-size: 65px;
    line-height: 79px;
    letter-spacing: 2.88px;
    color: var(--white);
    margin-top: 0;
    margin-bottom: 28px;
}
.about-left-text {
    width: 556px;
    font-weight: 400;
    font-size: 22px;
    line-height: 33px;
    color: rgba(255, 255, 255, 0.7);
    margin-bottom: 33px;
}
.about-right img {
    border-radius: 14px;
}

</style>