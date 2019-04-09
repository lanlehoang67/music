// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap
//= require javascripts/popper
//= require plugins/greensock/TweenMax.min.js
//= require plugins/greensock/TimelineMax.min.js
//= require plugins/scrollmagic/ScrollMagic.min.js
//= require plugins/greensock/animation.gsap.min.js
//= require plugins/greensock/ScrollToPlugin.min.js
//= require plugins/easing/easing.js
//= require plugins/colorbox/jquery.colorbox-min.js
//= require plugins/parallax-js-master/parallax.min.js
//= require plugins/EasyAutocomplete-1.3.5/jquery.easy-autocomplete.min.js
//= require episode.js.erb
//= require plugins/progressbar/progressbar.min.js

// $(document).on("input", ".search_input", function(){
//   var song = $(this).val();

//   $.ajax({
//     url: "/songs/new",
//     method: "GET",
//     dataType: "json",
//     data: {song: song},
//     error: function (xhr, status, error) {
//       console.error('AJAX Error: ' + status + error);
//     },
//     success: function (response) {
//       console.log(response);
//       var titles = response["title"];
//       $(".search_input").empty();


//       for(var i=0; i< titles.length; i++){
//         $(".result").append(`<h1>${titles[0]}</h1>`);
//       }
//     }
//   });
// });
document.addEventListener("turbolinks:load",function(){
  $input = $("[data-behavior='autocomplete']");
  console.log($input)
  var options ={
    getValue: "title",
    url: function(phrase){
      return "/search.json?q="+phrase;
    },
    categories: [
    {
      listLocation: "songs",
      header: "<strong>Songs</strong>"
    }
    ],
    list: {
      onChooseEvent: function(){
        var url = $input.getSelectedItemData().url
        $input.val("");
        Turbolinks.visit(url)
      }
    }
  }
  $input.easyAutocomplete(options)
})
