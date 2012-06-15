Director Overview
=====

Getting Started
----

1. [Download Director Files](https://bitbucket.org/ricardorauber/corona/downloads/director_by_ricardo_rauber_1_4.zip)
2. Run the provided samples to get a feel for the different options director can provide.
3. Ricardo also provides a [video tutorial for using director](http://rauberlabs.blogspot.com/2010/12/director-video-tutorial.html) if you would like to follow that.


Using Director
----

3. Download this (sample project)[http://github.com/shawngrimes/DirectorSample]
4. Copy director.lua and template.lua from step 1 into sample project folder
5. Load the director.lua file into your main.lua :
	````
    -- IMPORT DIRECTOR CLASS
    local director = require("director")
    ````

6. Create a new display group to hold the directorView (the directorView is a special property of the director library.
	````
	-- CREATE A MAIN GROUP
	local mainGroup = display.newGroup()
	````

7. Create a main function:
	````
	-- MAIN FUNCTION
	local main = function ()
	````
	
8. Add the directorView to the mainGroup display group:
	````
		-- Add the group from director class
		mainGroup:insert(director.directorView)
	````	

9. Now you can tell the director to load the first scene:

	````
		director:changeScene("scene1")
	````

10. We need to close our main function that we created in step 7:

	````
		-- Return true to signal that the function was successful
		return true
	end
	````

11. Call the main function that we created in step 7:
	````
	main()
	````

12. Now create a new file called "scene1.lua"
13. Copy the contents of template.lua into scene1.lua
14. Step 13 created the basic of our scene.  Let's add a text object so we know what scene we are showing, on line 34, replace `--- CODE ---` with the following:
	````
		local sceneTextObject=display.newText("Scene 1",0,0,native.systemFont,48)
		sceneTextObject.x=display.contentWidth/2
		sceneTextObject.y=display.contentHeight/4
	````

15. Add our new sceneTextObject to our local display group, `localGroup` is defined on line 28 of template.lua and since we copied the contents of template.lua into our scene1.lua file, it is now defined in scene1.lua on line 28 as well:
	````
		localGroup:insert(sceneTextObject)
	````
16. Save and relaunch your project.

Now let's add a button to scene 1.  
---
18. In "scene1.lua", let's we should add the "ui.lua" library.  This library creates a basic button implementation that is easy to use.
19. At line 23 of "scene1.lua", add the following:
	````
		--Add ui library for creating basic buttons
		local ui=require("ui")
	````

20. We will first create a function place holder that will be called when our button is tapped.  On line 39, add the following:
	````
		--Function that will be called when our button is tapped
	    local function loadPlayScene(event)
		    if event.phase == "release" then
			    print("Button was tapped")
		    end
	    end
	````

21. Now we will create our button and place it on the scene:
	````
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
	````
	
22. Save and re-launch
23. When you tap the button, it should print "Button was tapped" to the output/console window

Adding A Second Scene
----

1. Create a new file named "playScene.lua"
1. In "scene1.lua", after line 42, we want to insert a line to transition to our new "playScene.lua":
	````
		--Load playScene.lua with a moveFromRight transition
		director:changeScene("playScene", "moveFromRight")
	````
	
4. Save and close "scene1.lua"
5. Open "playScene.lua"
6. Copy the contents of "template.lua" into "playScene.lua"
7. At line 34 of "playScene.lua", add the following code:
	````
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

	````
	
7. Save and re-launch.  Your buttons should work and transition you between scene1 (the main menu) and playScene (the game scene)

Add A Third Scene
----
1. Open "scene1.lua".
2. Let's create a new button to load our third scene, so add a new line after line 58 and add the following:
	````
		
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
	
	````
	
3. Let's create our about scene, create a new file named "aboutScene.lua".
4. Open "aboutScene.lua" and copy in the following code:
	````
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
	    
	    local sceneTextObject=display.newText("About Scene",0,0,native.systemFont,48)
	    sceneTextObject.x=display.contentWidth/2
	    sceneTextObject.y=display.contentHeight/4
	    localGroup:insert(sceneTextObject)
	    --Function that will be called when our button is tapped
	    local function loadScene1(event)
		    if event.phase == "release" then
			    print("Button was tapped")
			    --Load playScene.lua with a moveFromRight transition
			    director:changeScene("scene1", "moveFromRight")
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
	````
5. Save and re-launch and you should be able to go to the play scene and the about scene

	