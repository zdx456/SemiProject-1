$(function(){
	var swiper = new Swiper('.swiper', {
        spaceBetween: 20,
		slidesPerView : 7,
		loop : false,
		loopAdditionalSlides : 1,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
});