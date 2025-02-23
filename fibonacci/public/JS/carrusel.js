// Le damos dinanismo al carrusel 
const contenidoCarrusel = document.querySelector(".contenidoCarrusel");
const btnSiguiente = document.querySelector("#btnSiguiente");
const btnAnterior = document.querySelector("#btnAnterior");

btnSiguiente.addEventListener("click", ()=>{contenidoCarrusel.style.backgroundImage = "url('../IMG/logo.png')";});

btnAnterior.addEventListener("click",()=>{
    contenidoCarrusel.style.backgroundImage = "url('../IMG/sitio/carruselUno.png')";
    contenidoCarrusel.style.opacity = "20%";
});

