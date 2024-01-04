function menu(){

const burger = document.querySelector(".burger");
const nav = document.querySelector(".nav-links") ;

burger.addEventListener("click", () => {
  nav.classList.toggle("nav-active");
});
};

window.addEventListener('turbo:load', menu);