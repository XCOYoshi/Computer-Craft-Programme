function text()
    input = read()
    
    if input == "start" and redstone.getInput("left") == false then
        redstone.setOutput("right", true)
        local b = fs.open("storage.txt", "w")
        b.write("true")
        b.close()
        print("Reactor starting")
       
    end
    
    if input == "start" and redstone.getInput("left") == true then
        print("Reactor in Failure Mode")
    end
    
    if input == "stop" then
        redstone.setOutput("right", false)
        local e = fs.open("storage.txt", "w")
        e.write("false")
        e.close()
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
print("")
local h = fs.open("storage.txt", "r")

if h.readAll() == "true" then
    redstone.setOutput("right", true)
    print("the Reactor is running")
    h.close()
else
    print("the Reactor is NOT running")
end

while true do
    parallel.waitForAny(text, emergency_stop)
end
