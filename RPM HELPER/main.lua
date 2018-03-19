-----------------------------------------------------------------------------------------
--game code below------------------ 
-- hide the status bar:
display.setStatusBar( display.HiddenStatusBar )

-- easy to use variables for screen-positions
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2
withScrn = display.contentWidth*2
heightScrn = display.contentHeight*2
topScrn = display.contentHeight
leftScrn = display.contentWidth
-- defintion of the background
--backgroundfill = display.newRect(leftScrn, topScrn, withScrn, heightScrn)
-- only the splash screen has a white background
--backgroundfill:setFillColor(255,255,255)

 
local composer = require ("composer")
local scene = composer.newScene()

 
local splash = display.newImage ("img/splash-full.jpg")
--splash:scale(.9,.9)
splash.x = centerX
splash.y = centerY
 
local function endSplash ()
 
	splash:removeSelf()
	splash = nil
	--background:removeSelf()
	--background = nil
	-- set default background color for the game
	
	composer.gotoScene ( "start", { effect = "crossFade"} )
end 
 
timer.performWithDelay(1500, endSplash)






