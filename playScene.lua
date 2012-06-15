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
	
	------------------
	-- Groups
	------------------
	
	local localGroup = display.newGroup()
	
	------------------
	-- Your code here
	------------------
	
	local sceneTextObject=display.newText("Play Scene",0,0,native.systemFont,48)
	sceneTextObject.x=display.contentWidth/2
	sceneTextObject.y=display.contentHeight/4
	localGroup:insert(sceneTextObject)
	--Function that will be called when our button is tapped
	local function loadScene1(event)
		if event.phase == "release" then
			print("Button was tapped")
			--Load playScene.lua with a moveFromLeft transition
			director:changeScene("scene1", "moveFromLeft")
		end
	end
	--Button to load main scene (scene1.lua)
	local mainButton = ui.newButton{
					default = "btn_main_up.png",
					over = "btn_main_down.png",
					onEvent = loadScene1,
					id = "mainButton"
	}
	--place button on scene
	mainButton.x=display.contentWidth/2
	mainButton.y=display.contentHeight/2
	--add button to local display group
	localGroup:insert(mainButton)

	
	------------------
	-- MUST return a display.newGroup()
	------------------
	
	return localGroup
	
end