function text()
    input = read()
    
    if input == "start" and redstone.getInput("left") == false then
        redstone.setOutput("right", true)
        print("Reactor starting")
    end
    
    if input == "start" and redstone.getInput("left") == true then
        print("Reactor in Failure Mode")
    end
    
    if input == "stop" then
        redstone.setOutput("right", false)
        print("Reactor stoping")
    end
end

function emergency_stop()
     os.pullEvent("redstone")

    if redstone.getInput("left") == true then
        redstone.setOutput("right", false)
        print("Reactor Emergency Stopped")
    end

end

term.clear()
term.setCursorPos(1, 1)
print("reactor-control")

while true do
    parallel.waitForAny(text, emergency_stop)
end
