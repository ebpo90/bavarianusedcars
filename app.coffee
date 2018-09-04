# Use desktop cursor
document.body.style.cursor = "auto"


Framer.DeviceView.Devices["custom"] =
"deviceType": "web"
"screenWidth": 1920
"screenHeight": 1100
"contentScale": 1
"devicePixelRatio": 1

Framer.Device.deviceType = "custom"

Framer.Device.screenBackground.visible = false

mainNavigation = new FlowComponent
	y: 0
	width: Screen.width
	height: Screen.height
	
	
mainNavigation.header = navigation

favNotificationBar.parent = filterBar
compareNotificationBar.parent = filterBar

filterHeader.y = 0
filterHeader.x = 0

carChartCompare.parent = comparison1
carChartCompare.x = 0

carChartCompare2.parent = comparison2
carChartCompare2.x = 0

compareSwitch1.onClick ->
	mainNavigation.showNext(comparison2, animate: false)
	checkState()	
	
compareSwitch2.onClick ->
	mainNavigation.showNext(comparison1, animate: false)	
	checkState()	

mainNavigation.showNext home1
filterMask.onClick ->
	mainNavigation.showNext(list1, animate: false)
	checkState()

filterMask2.onClick ->
	mainNavigation.showNext(list1, animate: false)
	checkState()
	
homeLink.onClick ->	
	mainNavigation.showNext(home1, animate: false)
	checkState()
	
seriesLabel1_1.onClick ->
	seriesSelector.opacity = 1

seriesSelector.onClick ->
	seriesLabel1.text = "4er"
	seriesSelector.opacity = 0
	
seriesLabel2_1.onClick ->
	seriesSelector2.opacity = 1

seriesSelector2.onClick ->
	seriesLabel2.text = "4er"
	seriesSelector2.opacity = 0	
	
merklisteLink.onClick ->
	if favNumber.text != "0"
		mainNavigation.showNext(merkelist1, animate: false)	
	else
	checkState()
	
homeAlternateButton.onClick ->
	mainNavigation.showNext(home2, animate: false)		
	checkState()	
		
comparisonLink.onClick ->
	if comparisonNumber.text != "0"
		mainNavigation.showNext(comparison1, animate: false)
	else
	checkState()	

gasType.onClick ->
	gasSelector.opacity = 1

gasSelector.onClick ->
	gasTypeText.text = "Diesel"
	gasSelector.opacity = 0
	
	
vonKm.onClick ->
	kmMinSelector.opacity = 1

kmMinSelector.onClick ->
	vonKmLabel.text = "100.000 km"
	kmMinSelector.opacity = 0
	
	
bisKm.onClick ->
	kmMaxSelector.opacity = 1

kmMaxSelector.onClick ->
	bisKmLabel.text = "120.000 km"
	kmMaxSelector.opacity = 0	
	
priceVon.onClick ->
	priceMinSelector.opacity = 1

priceMinSelector.onClick ->
	priceVonLabel.text = "20.000€"
	priceMinSelector.opacity = 0	
	
priceBis.onClick ->
	priceMaxSelector.opacity = 1

priceMaxSelector.onClick ->
	priceBisLabel.text = "60.000€"
	priceMaxSelector.opacity = 0				
saveSearch1.onClick ->
	mainNavigation.showOverlayCenter(loginScreen)
saveSearch2.onClick ->
	mainNavigation.showOverlayCenter(loginScreen)	
loginFrame.onClick ->
	mainNavigation.showPrevious()

klimaCheck.states.on =
	opacity: 1
	options: 
		time: 0.1
		
klimaSelector.onClick ->
	klimaCheck.stateCycle()	
filterBar = new Layer
	width: 1186
	height: 42
	x: Align.center()
	y: 88
# 	parent: mainNavigation
	backgroundColor: "#F6F6F6"	

checkState = ->	
	if mainNavigation.current == list1
		navigation.height = 200
		filterBar.visible = true
	if mainNavigation.current == home1
		navigation.height = 62
		filterBar.visible = false
		mainNavigation.scroll.contentInset =
		top: -6
	if mainNavigation.current == home2
		navigation.height = 62
		filterBar.visible = false
		mainNavigation.scroll.contentInset =
		top: -6		
	if 	mainNavigation.current == merkelist1
		navigation.height = 62
		filterBar.visible = false
		mainNavigation.scroll.contentInset =
		top: -6		
	if 	mainNavigation.current == comparison1
		navigation.height = 62
		filterBar.visible = false
		mainNavigation.scroll.contentInset =
		top: -6			
	if 	mainNavigation.current == comparison2
		navigation.height = 62
		filterBar.visible = false
		mainNavigation.scroll.contentInset =
		top: -6					
# 	else
# 		navigation.height = 62
		
	mainNavigation.scroll.content.draggable.momentum = true
	mainNavigation.scroll.content.draggable.overdrag = false
	mainNavigation.scroll.content.draggable.bounce = false
	mainNavigation.scroll.mouseWheelEnabled = true
	
	
favNotificationBar.states.appear =
	opacity: 1
	y: 60
	options: 
		time: 0.5
	
favNotificationBar.states.hidden =
	opacity: 0
	y: 10

favNotification.states.appear = 
	opacity: 1	
	
compareNotificationBar.states.appear =
	opacity: 1
	y: 60
	options: 
		time: 0.5
	
compareNotificationBar.states.hidden =
	opacity: 0
	y: 10

compareNotification.states.appear = 
	opacity: 1	
	
favorited = []

checkFavState = ->
	favNumber.text = favorited.length 
	if favNumber.text != "0"
		favNotification.animate('appear')
	else
		favNotification.opacity = 0
	
checkFavState()

comparisonList =[]

checkCompareState = ->
	comparisonNumber.text = comparisonList.length 
	if comparisonNumber.text != "0"
		compareNotification.animate('appear')
	else
		compareNotification.opacity = 0
	
checkCompareState()

mainNavigation.bringToFront
filterHeader.bringToFront
filterHeader.parent = navigation	

stars = [star1, star2, star3, star4, star5]



compareOn1.states.visible =
	opacity:1


compare1.onClick ->
		compareOn1.stateCycle()
		if compareOn1 not in comparisonList 
			comparisonList.push compareOn1
			compareNotificationBar.animate('appear')
			Utils.delay 5, ->
				compareNotificationBar.stateSwitch('hidden')
		else
			comparisonList.pop(compareOn1)
		checkCompareState()
		
	
compareOn2.states.visible =
	opacity:1



compare2.onClick ->
	compareOn2.stateCycle()	
	if compare2 not in comparisonList 
		comparisonList.push compare2
		compareNotificationBar.animate('appear')
		Utils.delay 5, ->
			compareNotificationBar.stateSwitch('hidden')
	else
		comparisonList.pop(compare2)
	checkCompareState()
			
compareOn3.states.visible =
	opacity:1



compare3.onClick ->
	compareOn3.stateCycle()	
	if compare3 not in comparisonList 
		comparisonList.push compare3
		compareNotificationBar.animate('appear')
		Utils.delay 5, ->
			compareNotificationBar.stateSwitch('hidden')
	else
		comparisonList.pop(compare3)
	checkCompareState()	
compareOn4.states.visible =
	opacity:1



compare4.onClick ->
	compareOn4.stateCycle()			
	if compare4 not in comparisonList 
		comparisonList.push compare4
		compareNotificationBar.animate('appear')
		Utils.delay 5, ->
			compareNotificationBar.stateSwitch('hidden')
	else
		comparisonList.pop(compare4)
	checkCompareState()
	
for star in stars
	star.name = "star" + (star + 1)
	
	star.states.favoff =
		backgroundColor: "#FFFFFF"
		options: 
			time: 0.2

	star.states.favon =
		backgroundColor: "#1C69D4"
		options: 
			time: 0.5
		
	star.onClick ->
		this.stateCycle("favon", "favoff")
		if this not in favorited 
			favorited.push this
			favNotificationBar.animate('appear')
			Utils.delay 5, ->
				favNotificationBar.stateSwitch('hidden')
		else
			favorited.pop(this)
		checkFavState()
checkState()

filterNavigation = new FlowComponent
	width: 1228
	height: 800
	x: Align.center
	y: 130
	visible: false
	backgroundColor: "#F6F6F6"

buttonLabels = ["Modell","Fahrzeugdetails", "Ausstattung", "Zustand", "Preis", "Standort"]

buttons = []


		
for i in [0...6] 
	filterButtonBar = new TextLayer
		name: buttonLabels[i]
		y: 0
		x: 198 * (i)
		width: 198
		height: 42
		backgroundColor: "#1C69D4"
		borderColor: "#fff"
		borderWidth: 1
		fontFamily: "Helvetica, sans-serif"
		color: "#fff"
		fontSize: 16
		fontWeight: "bold"
		padding: 
			top: 10
		textAlign: "center"
		text: buttonLabels[i]
		parent: filterBar
		options:
			time: 0.1
		
	filterButtonBar.states.active =
		backgroundColor: "#fff"
		color: "#333333"
		borderColor: "rgba(127,127,127,0.50)"
# 		shadowColor: "rgba(127,127,127,0.50)"
# 		shadowBlur: 10
# 		shadowX: 0
# 		shadowY: 2
		options: 
			time: 0.5
	
	buttons.push(filterButtonBar)
	
# 	filterButtonBar.onClick ->
# 		this.stateCycle('active','default')
# 		mainNavigation.showOverlayCenter(filterNavigation)



checkFilterSection = ->
	if filterNavigation.current.name == 'filterModel'
		buttons[0].stateSwitch('active')
		buttons[1].stateSwitch('default')	
		buttons[2].stateSwitch('default')
		buttons[3].stateSwitch('default')	
		buttons[4].stateSwitch('default')	
		buttons[5].stateSwitch('default')								
	if filterNavigation.current.name == 'detailFilter'
		buttons[0].stateSwitch('default')	
		buttons[1].stateSwitch('active')
		buttons[2].stateSwitch('default')
		buttons[3].stateSwitch('default')	
		buttons[4].stateSwitch('default')	
		buttons[5].stateSwitch('default')	
						
	if filterNavigation.current.name == 'ausstattungFilter'
		buttons[0].stateSwitch('default')	
		buttons[1].stateSwitch('default')
		buttons[2].stateSwitch('active')
		buttons[3].stateSwitch('default')	
		buttons[4].stateSwitch('default')	
		buttons[5].stateSwitch('default')
		
	if filterNavigation.current.name == 'zustandFilter'
		buttons[0].stateSwitch('default')	
		buttons[1].stateSwitch('default')
		buttons[2].stateSwitch('default')
		buttons[3].stateSwitch('active')	
		buttons[4].stateSwitch('default')	
		buttons[5].stateSwitch('default')
		
	if filterNavigation.current.name == 'preisFilter'
		buttons[0].stateSwitch('default')	
		buttons[1].stateSwitch('default')
		buttons[2].stateSwitch('default')
		buttons[3].stateSwitch('default')	
		buttons[4].stateSwitch('active')	
		buttons[5].stateSwitch('default')	
					
	if filterNavigation.current.name == 'standortFilter'
		buttons[0].stateSwitch('default')
		buttons[1].stateSwitch('default')
		buttons[2].stateSwitch('default')
		buttons[3].stateSwitch('default')
		buttons[4].stateSwitch('default')
		buttons[5].stateSwitch('active')
	
buttons[0].onClick ->
	if filterNavigation.visible == false
		mainNavigation.showOverlayCenter(filterNavigation)
		filterNavigation.showNext(filterModel)
	else 
		filterNavigation.showNext(filterModel)	
	checkFilterSection()
	
buttons[1].onClick ->
	if filterNavigation.visible == false
		mainNavigation.showOverlayCenter(filterNavigation)
		filterNavigation.showNext(detailFilter)
	else 
		filterNavigation.showNext(detailFilter)
	checkFilterSection()
	
buttons[2].onClick ->
	if filterNavigation.visible == false
		mainNavigation.showOverlayCenter(filterNavigation)
		filterNavigation.showNext(ausstattungFilter)
	else 
		filterNavigation.showNext(ausstattungFilter)
	checkFilterSection()	

buttons[3].onClick ->
	if filterNavigation.visible == false
		mainNavigation.showOverlayCenter(filterNavigation)
		filterNavigation.showNext(zustandFilter)
	else 
		filterNavigation.showNext(zustandFilter)
	checkFilterSection()
		
buttons[4].onClick ->
	if filterNavigation.visible == false
		mainNavigation.showOverlayCenter(filterNavigation)
		filterNavigation.showNext(preisFilter)
	else 
		filterNavigation.showNext(preisFilter)
	filterApplied.opacity = 1	
	checkFilterSection()	

buttons[5].onClick ->
	if filterNavigation.visible == false
		mainNavigation.showOverlayCenter(filterNavigation)
		filterNavigation.showNext(standortFilter)
	else 
		filterNavigation.showNext(standortFilter)
	checkFilterSection()	
	
filterNavigation.footer = stickyButtonsModel	

stickyButtonsModel.onClick ->
	mainNavigation.showPrevious()
	buttons[0].stateSwitch('default')
	buttons[1].stateSwitch('default')
	buttons[2].stateSwitch('default')
	buttons[3].stateSwitch('default')
	buttons[4].stateSwitch('default')
	buttons[5].stateSwitch('default')
	
	
# filterBarModal.x = 20
# filterBarModal.y = 20

filterNavigation.showNext(filterModel)
filterNavigation.scroll.content.scrollHorizontal = false
filterNavigation.scroll.content.scrollVertical = true
filterNavigation.scroll.content.draggable.momentum = true
filterNavigation.scroll.content.draggable.overdrag = false
filterNavigation.scroll.content.draggable.bounce = false
filterNavigation.scroll.mouseWheelEnabled = true

# filterModelButton.onClick ->
# # 	filterNavigation.visible = true
# 	mainNavigation.showOverlayCenter(filterNavigation)

mainNavigation.force2d = true
filterNavigation.force2d = true
# filterBar.bringToFront()
# navigation.bringToFront()
favNotificationBar.bringToFront()
compareNotificationBar.bringToFront()