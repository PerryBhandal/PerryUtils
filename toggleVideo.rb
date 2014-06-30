##
# When run, this script moves your mouse to the position specified by
# consants XLOC and YLOC. It then left clicks, wiats briefly, and return
# to its starting point.
##

XLOC = 4092
YLOC = 951
MIDCLICKDELAY = 0.05

def parseMousePos(mousePosStr)
	xPos = mousePosStr.scan(/^x:(.*?) y/)
	
	yPos = mousePosStr.scan(/x:.*? y:(.*?) screen/)
	
	return [xPos, yPos]
end

mousePosStr = `xdotool getmouselocation`
mousePos = parseMousePos(mousePosStr)
focusedWindow = `xdotool getwindowfocus`

system("xdotool mousemove #{XLOC} #{YLOC}")

system("xdotool click 1")

sleep(MIDCLICKDELAY)

system("xdotool mousemove #{mousePos[0]} #{mousePos[1]}")

system("xdotool windowfocus #{focusedWindow}")
