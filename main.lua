-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- IMPORT DIRECTOR CLASS
local director = require("director")
    
-- CREATE A MAIN GROUP
local mainGroup = display.newGroup()

-- MAIN FUNCTION
local main = function ()
	-- Add the group from director class
	mainGroup:insert(director.directorView)
	
	director:changeScene("scene1")
	
	-- Return true to signal that the function was successful
    return true
end

main()