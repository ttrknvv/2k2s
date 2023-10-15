<template>

    <header class="header">
        <div class="container">
            <nav class="navbar">
                <a href="#">
                    <img src="@/img/logo.svg" alt="Site Logo">
                </a>
                <ul class="menu">
                    <li class="menu-item"><a class="menu-link" href="#">Home</a></li>
                    <li class="menu-item"><a class="menu-link" href="#">Episodes</a></li>
                    <li class="menu-item"><a class="menu-link" href="#">About</a></li>
                    <li class="menu-item"><a class="menu-link" href="#">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>

</template>


<style>

.header {
    padding: 40px 0px;
}
.navbar {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}
.menu {
    display: flex;
    align-items: center;
}
.menu-item:not(:last-child) {
    margin-right: 40px;
}
.menu-link {
    color: var(--white);
    font-weight: 400;
    font-size: 17px;
    line-height: 27px;
    transition: all 0.3s ease;
}
.menu-link:hover,
.menu-link:focus {
    color: var(--accent);
}
.menu-link:active {
    opacity: 0.8;
}

</style>