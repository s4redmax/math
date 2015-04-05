local storyboard = require( "storyboard" )
local widget = require "widget"
local scene = storyboard.newScene()
local function nextpage()
        storyboard.gotoScene( "home", "crossFade", 1000 )    
    return true
end
function scene:createScene( event )
    local group = self.view
    local background = display.newImage( "background.jpg", display.contentWidth, display.contentHeight )
    _W = display.contentWidth /2 ;
	_H = display.contentHeight /2 ;
  	background.x=_W;
	background.y=_H;
	background.xScale = 3.5
	background.yScale = 3.2
		
	local text = display.newText("SCORE ",100,300,native.systemFont,30);
	text:setTextColor(0,0,0)
	text.xScale = 4
	text.yScale = 4
	text.x = 550
	text.y = 500
	
	local text1 = display.newText("HIGHSCORE ",100,300,native.systemFont,30);
	text1:setTextColor(0,0,0)
	text1.xScale = 4
	text1.yScale = 4
	text1.x = 550
	text1.y = 1000
	
	b = widget.newButton{
        defaultFile="arrow.png",
        onRelease = nextpage
    }
    b.xScale = 3
	b.yScale = 3
	b.x = 550 
	b.y = 1600
	
	group:insert ( background )
    group:insert ( text )
    group:insert ( text1 )
    group:insert ( b )
    end

function scene:enterScene( event )
    storyboard.removeScene("home")
	
end
function scene:exitScene( event )
    local group = self.view    
end
function scene:destroyScene( event )
    local group = self.view
end
   
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene
