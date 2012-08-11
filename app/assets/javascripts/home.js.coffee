# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#auction-slider").bxSlider
    auto: true
    controls: false
    pause: 6000

  gallery = $("#gallery").galleriffic("#navigation",
    delay: 2000
    numThumbs: 12
    imageContainerSel: "#slideshow"
    controlsContainerSel: "#controls"
    titleContainerSel: "#image-title"
    descContainerSel: "#image-desc"
    downloadLinkSel: "#download-link"
    fixedNavigation: true
    galleryKeyboardNav: true
    autoPlay: false
  )
  gallery.onFadeOut = ->
    $("#details").fadeOut "fast"

  gallery.onFadeIn = ->
    $("#details").fadeIn "fast"

  