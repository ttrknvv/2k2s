<template>
    <section class="episodes">
        <div class="container">
            <div class="episode">
                <div class="episode-top">
                    <h2>Latest episodes</h2>
                    <a class="episode-top-btn" href="#">View all episodes</a>
                </div>
                <div class="episode-bottom">
                    <div class="episode-item">
                        <div class="episode-item-img">
                            <img src="@/img/ep1.jpg" alt="Episode Image" srcset="@/img/ep1.jpg 1x, @/img/ep1@2x.jpg 2x">
                        </div>
                        <div class="episode-item-content">
                            <div class="item-top">
                                <span class="tag">Gear</span>
                                <p class="title">Episode 3</p>
                            </div>
                            <h3>Should you get outboard audio gear?</h3>
                            <p class="item-text">Is hardware really worth it when it comes to podcasting? The answer is...it depends. Here's our reasons on why you might want to consider picking something up.</p>
                            <a class="episode-top-btn" href="#">View Episode Details</a>
                        </div>
                    </div>
                    <div class="episode-item">
                        <div class="episode-item-img">
                            <img src="@/img/ep2.png" alt="Episode Image" srcset="@/img/ep2.png 1x, @/img/ep2@2x.png 2x">
                        </div>
                        <div class="episode-item-content">
                            <div class="item-top">
                                <span class="tag">Tips & Tricks</span>
                                <p class="title">Episode 2</p>
                            </div>
                                <h3>Mic tricks to take you to the next level</h3>
                                <p class="item-text">Stop rolling with those default settings on your mic. These small tweaks will take you from sounding good to great.</p>
                                <a class="episode-top-btn" href="#">View Episode Details</a>
                        </div>
                    </div>
                    <div class="episode-item">
                        <div class="episode-item-img">
                            <img src="@/img/ep3.png" alt="Episode Image" srcset="@/img/ep3.png 1x, @/img/ep3@2x.png 2x">
                        </div>
                        <div class="episode-item-content">
                            <div class="item-top">
                                <span class="tag">Gear</span>
                                <p class="title">Episode 1</p>
                            </div>
                            <h3>The best microphone under $200</h3>
                            <p class="item-text">With so many microphones on the market, how are you supposed to know what's the best? Take a look at our top picks.</p>
                            <a class="episode-top-btn" href="#">View Episode Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<style>

.episodes {
    margin: 90px 0px;
}
.episode-top {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}
.episode-top h2 {
    font-weight: 400;
    font-size: 64px;
    line-height: 79px;
    letter-spacing: 2.88px;
    margin-top: 0;
    margin-bottom: 0;
}
.episode-top-btn {
    background: var(--accent);
    color: var(--white);
    border: 1px solid var(--accent);
    border-radius: 6px;
    padding: 12px 20px;
    transition: all 0.3s ease;
}
.episode-top-btn:hover,
.episode-top-btn:focus {
    background-color: transparent;
    color: var(--accent);
}
.episode-top-btn:active {
    opacity: 0.8;
}
.episode-bottom {
    margin-top: 65px;
}
.episode-item {
    display: flex;
    flex-direction: row;
    align-items: center;
    background: #000000;
    border-radius: 32px;
    padding: 40px;
    margin-bottom: 60px;
}
.episode-item-img img {
    width: 1000px;
    height: auto;
    max-width: 100%;
    max-height: 100%;
}
.episode-item-content {
    margin: 0px 53px;
}
.item-top {
    margin-bottom: 18px;
}
.tag {
    background: #191919;
    border-radius: 6px;
    padding: 0px 16px;
    font-weight: 400;
    font-size: 18px;
    line-height: 27px;
    margin-top: 0;
    margin-bottom: 0;
}
.title {
    color: var(--accent);
    font-weight: 400;
    font-size: 17px;
    line-height: 27px;
    margin-top: 48px;
    margin-bottom: 0;
}
.episode-item-content h3 {
    width: 701px;
    font-weight: 400;
    font-size: 64px;
    line-height: 70px;
    letter-spacing: 2.56px;
    margin-top: 0;
    margin-bottom: 28px;
}
.episode-item-content .item-text {
    font-weight: 400;
    font-size: 22px;
    line-height: 33px;
    color: rgba(255, 255, 255, 0.7);
    margin-top: 0;
    margin-bottom: 20px;
}

</style>