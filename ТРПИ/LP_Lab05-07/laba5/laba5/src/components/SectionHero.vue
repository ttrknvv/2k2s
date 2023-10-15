<template>

    <section class="hero">
        <div class="container">
            <div class="hero-box">
                <div class="hero-box-image">
                    <img src="@/img/hero-img.png" alt="Hero image">
                </div>
                <div class="hero-box-content">
                    <h2>Take your podcast to the <span>next</span><b>level</b></h2>
                    <div class="listen">
                        <span>Listen on</span>
                        <div class="listen-box">
                            <a href="#"><img src="@/img/spotify.svg" alt="Spotify"></a>
                            <a href="#"><img src="@/img/2.svg" alt="Second"></a>
                            <a href="#"><img src="@/img/3.svg" alt="Third"></a>
                            <a href="#"><img src="@/img/4.svg" alt="Fourth"></a>
                            <a href="#"><img src="@/img/5.svg" alt="Fiveth"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</template>

<style>

.hero-box {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}
.hero-box-content {
    margin-left: 60px;
    margin-right: 100px;
}
.hero-box-content h2 {
    width: 526px;
    font-weight: 400;
    font-size: 70px;
    line-height: 88px;
    letter-spacing: 3.2px;
    color: var(--white);
}
.hero-box-content h2 span {
    background-image: url("@/img/bottom-line.svg");
}
.hero-box-content h2 b {
    font-weight: 700;
    font-size: 80px;
    line-height: 88px;
    margin-left: 25px;
}
.listen {
    margin-top: 90px;
    color: var(--white);
}
.listen-box {
    margin-top: 16px;
}
.listen-box a {
    margin-right: 17px;
}
.listen-box a:hover,
.listen-box a:focus {
    opacity: 0.7;
}
.listen-box a:active {
    opacity: 0.5;
}

</style>