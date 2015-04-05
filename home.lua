local storyboard = require( "storyboard" )
local widget = require "widget"
local scene = storyboard.newScene()


local function page()
        storyboard.gotoScene( "page", "slideLeft", 1000 )    
    return true
end

function scene:createScene( event )
    local group = self.view
    local backgroundMusic = audio.loadSound ("12.mp3")
    local backgroundMusicChannel = audio.play(backgroundMusic,{channel = 1, loops = -1 ,fadein= 500})
    local background = display.newImage( "background.jpg" )
    _W = display.contentWidth /2 ;
	_H = display.contentHeight /2 ;
  	background.x=_W;
	background.y=_H;
	background.xScale = 3.5
	background.yScale = 3.2
	
	local logo = display.newImage ("logomathtest.png")
	logo.xScale = 1
	logo.yScale = 1
	logo.x = 600
	logo.y = 400
	
	local function handleButtonEvent( event )
    if ( "ended" == event.phase ) then 
    audio.stop( backgroundMusicChannel )
    storyboard.gotoScene("page")
    end
end 
  
    buttonHome = widget.newButton{
        defaultFile="start.png",
        onEvent = handleButtonEvent
        
    }
   	
	buttonHome.xScale = 4
	buttonHome.yScale = 4
	buttonHome.x = 600
	buttonHome.y = 1100
	
	local text = display.newText("HigHScore : ",100,300,native.systemFont,30);
	text:setTextColor(0,0,0)
	text.xScale = 4
	text.yScale = 4
	text.x =  450
	text.y = 1500
	
    group:insert ( background )
    group:insert ( logo )
    group:insert ( buttonHome )
    group:insert ( text )

end
function scene:enterScene( event )
    local group = self.view    
end
function scene:exitScene( event )
    local group = self.view    
end
function scene:destroyScene( event )
    local group = self.view
    if buttonHome then
        buttonHome:removeSelf()
        buttonHome = nil
    end        
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene
