$ ->
  $("select:not(.multiselect)").chosen()

  $("a.fancybox").fancybox({
    openEffect	: 'elastic',
    closeEffect	: 'elastic',

    helpers : {
      title : {
        type : 'inside'
      }
    }
  })


  $('.auto-numeric').autoNumeric({aSep: '', aDec: '.'})
