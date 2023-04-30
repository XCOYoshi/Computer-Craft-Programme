os.loadAPI("button.lua") 
local monitor1 = peripheral.wrap("back")
rednet.open("right")  

function writetoscreen (screen, positon, line, text, color, scale)
    screen.setCursorPos(positon, line)
    screen.setTextColor(color)
    screen.write(text)
    print("line " .. line .." was printet")
end

function writetoscreenwithoutlog (screen, positon, line, text, color, scale)
    screen.setCursorPos(positon, line)
    --screen.clearLine()  
    screen.setTextColor(color)
    screen.write(text)
end

function printscreen()
    button.setMonitor(monitor1)
    button1 = button.create("button1")
    button1.setPos(2,2)
    button1.setText("Tor")
    button1.setSize(5,3)
    button1.setAlign("center")
    button1.onClickReturn(2)
    button1.setActive(true)

end

function buttonloop()

    local button = button.await(button1)

    if button == 2 then
        
        if paddorr1 == true then
            paddorr1 = false
            button1.setText(" Zu")
            rednet.broadcast("zu","paddor4")
            
        else
            paddorr1 = true
            button1.setText("Auf")
            rednet.broadcast("auf","paddor4")        
        end
    end
end

function networking()
    senderId, message, protocol = rednet.receive("paddor4")

    if message == "zu" then
        paddorr1 = false
        button1.setText(" Zu")
    end
    if message == "auf" then
        paddorr1 = true
        button1.setText("Auf")
    end

end

printscreen()
term.clear()
term.setCursorPos(1, 1)


while true do
    parallel.waitForAny(buttonloop, networking)
end