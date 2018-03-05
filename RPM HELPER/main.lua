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
--numericField2.inputType = "number"

--local subtn = display.newRect( w/2, h-50, w, 50 )
--subtn:setFillColor( 0.5 )
	
local widget = require( "widget" )
-- Function to handle button events
local function handleButtonEvent( event )
		if ("began"  == event.phase) then
			--subtn:setFillColor( 0.1 )
		elseif ( "ended" == event.phase ) then
			cs = numericField.text
			dia = numericField2.text
			var = 12*cs/(dia*3.1416)
			var = math.floor(var)
			local alert = native.showAlert( "Corona", var .." RPM", {"Ok"} )
			--subtn:setFillColor( 0.5 )
		end
	end

local btnSub = display.newImageRect( "img/submit.png", 180, 40 )
btnSub.x = w/2
btnSub.y = h
	
-- Create the widget
local button1 = widget.newButton(
    {
        left = 70,
        top = h-10,
        id = "button1",
        label = "Submit",
        onEvent = handleButtonEvent,
		labelColor = { default={ 1, 1, 1 }, over={ .5, .5, .5 } }
    }
)