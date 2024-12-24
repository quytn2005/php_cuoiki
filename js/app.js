//sử dụng thư viện Slick Carousel để tạo các slider (băng chuyền hình ảnh/sản phẩm) trên trang web.
var nf = new Intl.NumberFormat();

$(document).ready(function(){
    $('.slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        dots: true,
        fade: true,
        speed: 1000,
        autoplay: true,
        autoplaySpeed: 3000,
        prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa-solid fa-chevron-left'></i></button>",
        nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa-solid fa-chevron-right'></i></button>"
    });
  });
  
  $('.product-list').slick({
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa-solid fa-chevron-left'></i></button>",
    nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa-solid fa-chevron-right'></i></button>",
    dots: false
  });
  
  



