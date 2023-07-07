/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const urlParams = new URLSearchParams(window.location.search);
const page = urlParams.get('page');
const pageInt = parseInt(page, 10);
if(page === null){
    pageInt =  0;
}

var navItems = document.getElementsByClassName('js_selectNav');
var contentItems = document.getElementsByClassName('js_content');

for (var i = 0; i < navItems.length; i++) {
    navItems[i].classList.remove('selected');
}



navItems[pageInt].classList.add('selected');