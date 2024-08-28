import Swiper, { Navigation, Pagination } from 'swiper';
import '/node_modules/swiper/swiper-bundle.min.css';

document.addEventListener('DOMContentLoaded', function () {
    var swiper = new Swiper('.swiper-container', {
        autoHeight: true, // makes slider height responsive to landscape / portrait images
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
});
