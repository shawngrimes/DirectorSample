module(..., package.seeall)

--====================================================================--
-- SCENE: [NAME]
--====================================================================--

--[[

 - Version: [1.0]
 - Made by: [name]
 - Website: [url]
 - Mail: [mail]

******************
 - INFORMATION
******************

  - [Your info here]

--]]

new = function ()
	--Add ui library for creating basic buttons
	local ui=require("ui")
	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	
	------------------
	-- Your code here
	------------------
	
	local sceneTextObject=display.newText("Scene 1",0,0,native.systemFont,48)
	sceneTextObject.x=display.contentWidth/2
	sceneTextObject.y=display.contentHeight/4
	localGroup:insert(sceneTextObject)
	--Function that will be called when our button is tapped
	local function loadPlayScene(event)
		if event.phase == "release" then
			print("Button was tapped")
			--Load playScene.lua with a moveFromRight transition.cancel
			director:changeScene("playScene", "moveFromRight")
		end
	end
	--Button to load play scene
	local playButton = ui.newButton{
					default = "btn_play_up.png",
					over = "btn_play_down.png",
					onEvent = loadPlayScene,
					id = "playButton"
	}
	--place button on scene
	playButton.x=display.contentWidth/2
	playButton.y=display.contentHeight/2
	--add button to local display group
	localGroup:insert(playButton)
	
	--Function that will be called when our about button is tapped
	local function loadAboutScene(event)
		if event.phase == "release" then
			print("About Button was tapped")
			--Load playScene.lua with a moveFromLeft transition
			director:changeScene("aboutScene", "moveFromLeft")
		end
	end
	--Button to load about scene
	local aboutButton = ui.newButton{
					default = "btn_about_up.png",
					over = "btn_about_down.png",
					onEvent = loadAboutScene,
					id = "aboutButton"
	}
	--place button on scene
	aboutButton.x=display.contentWidth/2
	--Create a variable that defines the vertical buffer between buttons
	local verticalBuffer=10
	--Place the aboutButton below the playButton with a vertical buffer
	aboutButton.y=playButton.y+playButton.contentWidth/2 + verticalBuffer
	--add button to local display group
	localGroup:insert(aboutButton)
	
	------------------
	-- MUST return a display.newGroup()
	------------------
	
	return localGroup
	
end