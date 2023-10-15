<template>
    <footer class="footer">
        <div class="container">
            <div class="footer-box">
                <div class="footer-left">
                    <a href="#">
                        <img src="@/img/logo.svg" alt="Site Logo">
                    </a>
                    <div class="social">
                        <a href="#"><img src="@/img/in.svg" alt="Instagram"></a>
                        <a href="#"><img src="@/img/tw.svg" alt="Twitter"></a>
                        <a href="#"><img src="@/img/fb.svg" alt="Facebook"></a>
                    </div>
                </div>
                <div class="footer-right">
                    <ul class="footer-menu">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Episodes</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                    <ul class="footer-menu">
                        <li><a href="#">Style Guide</a></li>
                        <li><a href="#">Instructions</a></li>
                        <li><a href="#">Changelog</a></li>
                        <li><a href="#">Credit</a></li>
                        <li><a href="#">Powered by Webflow</a></li>
                        <li><a href="#">Licenses</a></li>
                    </ul>
                    <div class="music-pls">
                        <img src="@/img/spotify.svg" alt="Spotify">
                        <img src="@/img/2.svg" alt="Second">
                        <img src="@/img/3.svg" alt="Third">
                        <img src="@/img/4.svg" alt="Fourth">
                        <img src="@/img/5.svg" alt="Fiveth">
                    </div>
                </div>
            </div>
        </div>
    </footer>
</template>

<style>

.footer {
    margin-top: 150px;
    padding-bottom: 150px;
}
.footer-box {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}
.social {
  margin-top: 30px;
}
.social a {
    margin-right: 13px;
}
.social a:hover,
.social a:focus {
    opacity: 0.7;
}
.social a:active {
    opacity: 0.5;
}
.footer-right {
    display: grid;
    grid-template-columns: auto auto auto;
    gap: 150px;
}
.footer-menu {
    margin: 0;
    padding: 0;
}
.footer-menu li {
    margin-bottom: 10px;
}
.footer-menu li a {
    font-weight: 400;
    font-size: 17px;
    line-height: 27px;
    color: #ffffff;
}
.footer-menu li a:hover,
.footer-menu li a:focus {
    opacity: 0.6;
}
.footer-menu li a:active {
    opacity: 0.4;
}
.music-pls img {
    margin-right: 17px;
}

</style>