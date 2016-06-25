# Import file "FramerWorkshopV2"
s = Framer.Importer.load("imported/FramerWorkshopV2@1x")

# Puts the indicator dots and skip on top of everything
s.pagination.superLayer = Framer.Device.Screen
s.skip.superLayer = Framer.Device.Screen

# Set the default animation time and curve
Framer.Defaults.Animation =
	curve: "spring(350, 20)"
	time: 0.4

# Set-up PageComponent
pager = new PageComponent
	width: Screen.width
	height: Screen.height
	backgroundColor: null
	scrollVertical: false

# Add pages
pager.addPage(s.one)
pager.addPage(s.two)
pager.addPage(s.three)
pager.addPage(s.four)

# Snap to the homescreen by default
pager.snapToPage(s.ome, false)

# Allows pagination to update on a paging event
pager.on "change:currentPage", ->
	s.active.x = s.active.width * 2 * pager.horizontalPageIndex(pager.currentPage)

# Starting states
s.device.x = 750
s.tabs.y = 660
s.tabs.opacity = 0
s.content.y = 264
s.topPage.y = 216
s.signed.opacity = 0

# Modulate
pager.content.on "change:x", ->
# First Transition
	s.drive.x = Utils.modulate(this.x, [0, -750], [418, -200], true)
	s.content.y = Utils.modulate(this.x, [0, -750], [264, 254], true)
	s.topPage.y = Utils.modulate(this.x, [0, -750], [216, 206], true)
	s.middlePage.rotation = Utils.modulate(this.x, [0, -750], [0, -10], true)
	s.middlePage.opacity = Utils.modulate(this.x, [0, -750], [0, 1], true)
	s.bottomPage.rotation = Utils.modulate(this.x, [0, -750], [0, 5], true)
	s.bottomPage.opacity = Utils.modulate(this.x, [0, -750], [0, 1], true)
# Second Transition
	s.device.x = Utils.modulate(this.x, [-750, -1400], [750, 220], true)
	s.tabs.y = Utils.modulate(this.x, [-1400, -1500], [660, 620], true)
	s.tabs.opacity = Utils.modulate(this.x, [-1400, -1500], [0, 1], true)
	s.topPage.opacity = Utils.modulate(this.x, [-750, -1500], [1, 0], true)
	s.middlePage.opacity = Utils.modulate(this.x, [-750, -1500], [1, 0], true)
	s.bottomPage.opacity = Utils.modulate(this.x, [-750, -1500], [1, 0], true)
# Third Transition
	s.signed.opacity = Utils.modulate(this.x, [-1900, -2250], [0, 1], true)
	s.signed.y = Utils.modulate(this.x, [-1500, -2250], [663, 178], true)

