-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- ads below--------------------------------------------------------------------------------
local revmob = require( "plugin.revmob" )
local placementID = "Fullscreen"
local function adListener( event )
    if ( event.phase == "sessionStarted" ) then  -- Successful initialization
        -- Load a RevMob ad
        revmob.load( "interstitial", placementID )
 
    elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
        -- Show the ad
        revmob.show( placementID )
    end
end
-- Initialize RevMob
revmob.init( adListener, { appId="5aa16d4aa30c3b1c882e3a2b " } )
----------------------------------------------------------------------------------------
local w = display.viewableContentWidth
local h = display.viewableContentHeight
local dia = numericField
local cs = numericField2
--local rpm = 
----------------------------------------------------------------------------------------
local myText = display.newText( "Cutting speed!", 70, 0, native.systemFont, 16 )
myText:setFillColor( 8, 8, 8 )
local numericField
-- Create text field
numericField = native.newTextField( w/2, 30, w-10, 30 )
numericField.placeholder = "SFM"
numericField.text = "150"
numericField.inputType = "number"


local mydia = display.newText( "Cutter Diameter", 70, 60, native.systemFont, 16 )
mydia:setFillColor( 8, 8, 8 )
local numericField2
-- Create text field
numericField2 = native.newTextField( w/2, 90, w-10, 30 )
numericField2.placeholder = "SFM"
numericField2.text = ".500"
--numericField2.inputType = "number"

local subtn = display.newRect( w/2, h-50, w, 50 )
subtn:setFillColor( 0.5 )
	
local widget = require( "widget" )
-- Function to handle button events
local function handleButtonEvent( event )
		if ("began"  == event.phase) then
			subtn:setFillColor( 0.1 )
		elseif ( "ended" == event.phase ) then
			cs = numericField.text
			dia = numericField2.text
			var = 12*cs/(dia*3.1416)
			var2 = format( "%0.3f", var )
			local alert = native.showAlert( "Corona", var2 .." RPM" )
			subtn:setFillColor( 0.5 )
		end
	end


-- Create the widget
local button1 = widget.newButton(
    {
        left = 70,
        top = h-75,
        id = "button1",
        label = "Submit",
        onEvent = handleButtonEvent,
		labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    }
)