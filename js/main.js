
$(window).scroll(function() {
    var height = $(window).scrollTop();    
    if(height  > 50) {
        $("#semi-circulo").stop().animate({'top':'-200px'},400);
        $("#semi-circulo-menor").stop().animate({'top':'-194px'},400);
        $("#header-principal").stop().animate({'top':'-25px'},100);
        $(".logo-recolhido").stop().animate({opacity:'show', 'top':'20px'},100);
        $(".logo").stop().animate({opacity:'hide'},100);
        $(".open-menu").stop().animate({'top':'20px'});
        $(".whatsapp").stop().animate({'top':'25px'});
        
    }
    if(height  < 50) {        
        $("#header-principal").stop().animate({'top':'0'},100);
        $(".logo-recolhido").stop().animate({opacity:'hide'},100);
        $(".logo").stop().animate({opacity:'show'},100);
        $("#semi-circulo").stop().animate({'top':'-147px'},400);
        $("#semi-circulo-menor").stop().animate({'top':'-138px'},400);
        $(".open-menu").stop().animate({'top':'10px'});
        $(".whatsapp").stop().animate({'top':'15px'});
    }    
}); 


/*******************************************************************
Menu Hamburguer
*******************************************************************/
(function() {

"use strict";

var toggles = document.querySelectorAll(".c-hamburger");

for (var i = toggles.length - 1; i >= 0; i--) {
var toggle = toggles[i];
toggleHandler(toggle);
};

function toggleHandler(toggle) {
toggle.addEventListener( "click", function(e) {
    e.preventDefault();
    (this.classList.contains("is-active") === true) ? this.classList.remove("is-active") : this.classList.add("is-active");
    (this.classList.contains("is-active") === true) ? abreMenu() : fechaMenu();        
});
}
})();
/*******************************************************************
Menu Hamburguer //
*******************************************************************/


/*******************************************************************
Funções abre e fecha telas de Menu
*******************************************************************/    
function abreMenu() {     
    $(".menu-principal").animate({opacity:"show" }, 100); 
    $(".conteudo-menu-principal").animate({opacity:"show" }, 400);
    $(".menu-principal li").addClass("wow bounceInDown animated");
}

function fechaMenu() {        
    $(".conteudo-menu-principal").animate({opacity:"hide" }, 400);
    $(".menu-principal li").removeClass("wow bounceInDown animated");
}
/*******************************************************************
Funções abre e fecha telas de Menu //
*******************************************************************/ 


$('.carousel').carousel({
    interval: 10000
})



/*
jQuery(document).ready(function($) { 
    $(".scroll").click(function(event){        
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 8000);
    });
});
*/