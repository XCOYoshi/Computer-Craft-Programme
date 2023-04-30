rednet.open("right")
term.clear()
term.setCursorPos(1, 1)

while true do
    senderId, message, protocol = rednet.receive("paddor3")
    if message == "zu" then
        redstone.setOutput("top", true)
    end
    if message == "auf" then
        redstone.setOutput("top", false)
    end
end