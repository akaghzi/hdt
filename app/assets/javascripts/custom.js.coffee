ready = ->
  $("#search").autocomplete
    source: "/suggest_terms"
    delay: 1000
    minLength: 3
		
  $("#lisearch").autocomplete
    source: "/list_items_terms"
    delay: 1000
    minLength: 3
		
  $("#fisearch").autocomplete
    source: "/favorite_items_terms"
    delay: 1000
    minLength: 3

  $("#tisearch").autocomplete
    source: "/task_terms"
    delay: 1000
    minLength: 3
			
	$("a[rel~=popover], .has-popover").popover()
	
	$("a[rel~=tooltip], .has-tooltip").tooltip()
		
$(document).ready(ready)
$(document).on('page:load', ready)