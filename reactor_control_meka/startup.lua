function text()
    input = read()
    if input == "start" and redstone.getInput("left") == false then
        redstone.setOutput("right", true)
        print("Reactor starting")
    end
end

function emergency_stop()
     os.pullEvent("redstone")

    if redstone.getInput("left") == true then
        redstone.setOutput("right", false)
        print("Reactor Emergency Stoped")
    end

end

term.clear()
term.setCursorPos(1, 1)
print("Reactore Contole")

while true do
    parallel.waitForAny(text, emergency_stop)
end