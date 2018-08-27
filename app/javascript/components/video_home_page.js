// console.log($);


// $(window).scroll(function() {
//    var hT = $('#one').offset().top,
//        hH = $('#one').outerHeight(),
//        wH = $(window).height(),
//        wS = $(this).scrollTop();

//        console.log(Math.round(hT), wS)

//        if (wS == Math.round(hT)){
//            console.log('H1 on the view!');
//            changeVideoSource();

//        }
// });


// function changeVideoSource(){
//   var video = document.getElementById('vidhome');
//   var source = document.createElement('source');
//   console.log(video,source);
//   // video.pause();
//   // video.removeAttribute('src'); // empty source
//   // video.load();

//   source.setAttribute('src', 'https://res.cloudinary.com/ebc-industries/video/upload/v1534130774/bot-full-on.mov');

//   video.appendChild(source);
//   video.play();

//   setTimeout(function() {
//       video.pause();

//       source.setAttribute('src', 'https://res.cloudinary.com/ebc-industries/video/upload/v1534130774/bot-full-on.mov');

//       video.load();
//       video.play();
//   }, 100);

// }


// // # track event listener on scroll
// // # each time event is on scroll run function to track the position
// // #when position match interested area then replace the vid
// // function offset(el) {
// //   let rect = el.getBoundingClientRect(),
// //   scrollLeft = window.pageXOffset || document.documentElement.scrollLeft,
// //   scrollTop = window.pageYOffset || document.documentElement.scrollTop;
// //   return { top: rect.top + scrollTop, left: rect.left + scrollLeft }
// // }

// // const sectionOne = offset(document.getElementById("one"));
// // const sectionTwo = offset(document.getElementById("two"));
// // const sectionThree = offset(document.getElementById("three"));
// // // t > r.windowHeight * e.screenPosition)
// // window.addEventListener('scroll', function(e) {

// //   let position = window.scrollY;
// //   console.log(e.screenPosition)

// //   if (window.scrollY == Math.round(sectionTwo.top)) {
// //     alert("entering 2")
// //   }

// //   if (window.scrollY == Math.round(sectionThree.top)) {
// //     alert("entering 3")
// //   }

// //   if (window.scrollY == Math.round(sectionOne.bottom)) {
// //     alert("entering 1")
// //   }
// // });
