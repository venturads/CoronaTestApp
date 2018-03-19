-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
----------------------------------------------------------------------------------------
local w = display.viewableContentWidth
local h = display.viewableContentHeight
local dia = numericField
local cs = numericField2
local chipload
local flutes
local image = display.newImageRect( "img/cnc-bg.jpg", w+100, h+100 )
image.x = display.contentCenterX
image.y = display.contentCenterY
----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
local options = 
{
	text = "Cutting speed!",
	x = 80,
	y = 0,
	width = 120,
	font = native.systemFont,
	fontSize = 16,
	align = "left"
}
local myText = display.newText( options )
myText:setFillColor( 8, 8, 8 )
myText.align = "left"
local numericField
-- Create text field
numericField = native.newTextField( w/2, 30, w-10, 30 )
numericField.placeholder = "SFM"
numericField.text = "150"
numericField.inputType = "number"

local options = 
{
	text = "Cutting dia!",
	x = 80,
	y = 60,
	width = 120,
	font = native.systemFont,
	fontSize = 16,
	align = "left"
}
local mydia = display.newText( options )
mydia:setFillColor( 8, 8, 8 )
mydia.align = "left"
local numericField2
-- Create text field
numericField2 = native.newTextField( w/2, 90, w-10, 30 )
numericField2.placeholder = "SFM"
numericField2.text = ".500"

local options = 
{
	text = "Chip Load",
	x = 80,
	y = 120,
	width = 120,
	font = native.systemFont,
	fontSize = 16,
	align = "left"
}
local chipload = display.newText( options )
chipload:setFillColor( 8, 8, 8 )
chipload.align = "left"
local numericField3
-- Create text field
numericField3 = native.newTextField( w/2, 150, w-10, 30 )
numericField3.placeholder = "SFM"
numericField3.text = ".002"

local options = 
{
	text = "Flutes",
	x = 80,
	y = 185,
	width = 120,
	font = native.systemFont,
	fontSize = 16,
	align = "left"
}
local flutes = display.newText( options )
flutes:setFillColor( 8, 8, 8 )
flutes.align = "left"
local numericField4
-- Create text field
numericField4 = native.newTextField( w/2, 215, w-10, 30 )
numericField4.placeholder = "SFM"
numericField4.text = "4"
numericField4.inputType = "number"
	
local btnSub = display.newImageRect( "img/submit.png", 150, 30 )
btnSub.x = w/2
btnSub.y = h
function goSub(event)
if event.phase == "began" then			
	elseif event.phase == "ended" or event.phase == "cancelled" then
			cs = numericField.text
			dia = numericField2.text
			chipload = numericField3.text
			flutes = numericField4.text
			var = 12*cs/(dia*3.1416)
			var = math.floor(var)
			fed = var * chipload * flutes
			fed = math.floor(fed)
			local alert = native.showAlert( "Venturads.com", var .." RPM, " .. fed .. " Feedrate(in/min)" , {"Ok"} )
			--subtn:setFillColor( 0.5 )
		end
	return true
end
btnSub:addEventListener("touch", goSub)