
// Show Search
const search = document.querySelector('.search');
const btnSearch = document.querySelector('.search-click');
const btnClose = document.querySelector('.search-close');
const modalSearch = document.querySelector('.modal__search');
function isShow(){
  search.classList.add('isShow');
}
function isHide(){
  search.classList.remove('isShow');
}
btnSearch.addEventListener('click',isShow);
btnClose.addEventListener('click',isHide);
modalSearch.addEventListener('click', isHide);
// hide search
// Show modal header liked/ cart
const modalBtn = document.querySelectorAll('.modal__header-click');
const modalHeaderShow = document.querySelectorAll('.modal__header-show');
const modalHide = document.querySelectorAll('.modal__hide');

modalBtn.forEach((item , idx) => {
  item.onclick = function () {
    // function isHideModal() {
    //   modalHeaderShow[idx].classList.remove('isShow')
    // }
    // if (modalHeaderShow[idx].classList.contains('isShow')) {
    //   modalHide[idx].addEventListener('click', isHideModal)
    // } else {
    //   modalHeaderShow[idx].classList.add('isShow')
    // }
    modalHeaderShow[idx].classList.toggle('isShow')
  }
})  

// // WRONG
// const modalLikedClick = document.querySelector('.react__love');
// const modalLiked = document.querySelector('.liked');
// const modalCart = document.querySelector('.cart-list');
// const modalLikedBtn = document.querySelector('.liked__footer-btn');
// const modalCartBtn = document.querySelector('.cart__btn-right')
// function modalLikedShow(){
//   modalLiked.classList.add('isShow')
// }
// function modalLikedHide(){
//   modalLiked.classList.remove('isShow')
// }
// function modalCartShow(){
//   modalCart.classList.add('isShow')
// }
// function modalCartHide(){
//   modalCart.classList.remove('isShow')
// }
// modalLikedClick.addEventListener('click', modalLikedShow);
// modalLikedBtn.addEventListener('click',modalLikedHide)

// end modal header liked / add
// show from login
const loginForm = document.querySelector('.login');
const btnLogin = document.querySelector('.login-click');
const btnCloseLogin = document.querySelector('.login__close');
const modalLogin = document.querySelector('.login__container')
function isShowLogin(){
  loginForm.classList.add('isShow');
}
function isHideLogin(){
  loginForm.classList.remove('isShow');
}
btnLogin.addEventListener('click',isShowLogin);
btnCloseLogin.addEventListener('click',isHideLogin);
modalLogin.addEventListener('click',function(e){
  e.stopPropagation();
});
// end show form

// <!-- js modal notify -->
const modalNotify = document.querySelector('.modal__notify');
const modalNotifyClose = document.querySelector('.modal__notify-btn-close');
const modalNotifyContainer = document.querySelector('.modal__notify-container');
function hideNotify(){
    modalNotify.classList.remove('isShow');
}
modalNotifyClose.addEventListener('click', hideNotify);

modalNotify.addEventListener('click', hideNotify);
modalNotifyContainer.addEventListener('click' , function (event){
event.stopPropagation()
});

// <!-- end modal notify -->
// begin responsive tab menu js
const showNav = document.querySelector('.header__nav');
const btnBar = document.querySelector('.bar-menu')
btnBar.onclick = function () {
  showNav.classList.toggle('block')
}
// end responsive tab menu js
// // Reveal Website 
ScrollReveal({
    distance: '15px',
    duration: 2500,
    delay: 250,
})
ScrollReveal().reveal('.banner , .product , .product__best-seller, .product__list', {delay : 200})
// end Reveal 
// product next page
const filterOptions = document.querySelectorAll(".product__filter-options");
const productOptions = document.querySelectorAll(".product__row");

const tabActive = document.querySelector(".product__filter-options.active");


filterOptions.forEach((option, index) => {
  const productOption = productOptions[index];

  option.onclick = function () {
   document.querySelector(".product__filter-options.active").classList.remove("active");
   document.querySelector(".product__row.active").classList.remove("active");


    this.classList.add("active");
    productOption.classList.add("active");
  };
});

// load page
function loader(){
    document.querySelector('.loader-homepage').classList.add('fade-out');
  }
  
  function fadeOut(){
    setInterval(loader, 500);
  }
  
  window.onload = fadeOut;