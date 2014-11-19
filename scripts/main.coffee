###
	lessons-in-ember

	main.coffee

	@author Sean

	@note Created on 2014-11-16 by PhpStorm
	@note uses Codoc
	@see https://github.com/coffeedoc/codo
###

jQuery(document).ready ->
	checkSupport = ->
		alert "Your browser does not appear to support CSS3 transforms.  Please note that the browser experience will likely suck or really lack stuff.  Maybe time to upgrade your browser (Chrome, Firefox, Opera)?" if Modernizr?.csstransforms is off
		alert "Your browser does not appear to support CSS3 animations.  This really is bad, and it means your experience is limited.  Maybe upgrade to Chrome, Firefox, or Opera?" if Modernizr?.cssanimations is off
		alert "Your browser does not appear to support CSS3 3d Transforms.  This is not so bad, but you should probably consider upgrading to a browser that has this (Chrome, Firefox, Opera."  if Modernizr?.csstransforms3d is off
		Modernizr?.csstransforms and Modernizr?.cssanimations and Modernizr?.csstransforms3d
	checkToggleControls = ($slideArea, $toggledControls) ->
		console.warn "Could not find area for slides" if $slideArea.length < 1 or $toggledControls.length < 1
		$slideArea.on("enterStep", ->
			$toggledControls.toggle("fast") if $(this).hasClass("toggle-controls")
		)
	main = ->
		if checkSupport()
			$navControls = $(".controls")
			$slides = $(".slides").jmpress(
				# afterInit: checkToggleControls($(this), $navControls)
			)
			$nextButtons = $(".next-slide").on("click", ->
				$(".slides").jmpress("next")
				false
			)
			$previousButtons = $(".previous-slide").on("click", ->
				$(".slides").jmpress("prev")
				false
			)
	main()
