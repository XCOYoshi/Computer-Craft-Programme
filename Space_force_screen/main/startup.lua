-- https://raw.githubusercontent.com/Siarko/ButtonApi/master/button.lua
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

function prinmainscreenprint ()
    -- Monitor 1 args
    monitor1.clear()    
    monitor1.setTextScale(1)

    -- Monitor 1 text
    writetoscreen(monitor1, 1 , 1, "Space Force", colors.cyan)  
    writetoscreen(monitor1, 1 , 2, "we are on the moon", colors.lightGray)
    writetoscreen(monitor1, 1 , 3, "and on mars", colors.red)
    writetoscreen(monitor1, 1 , 4, "and venus to.", colors.pink)
    writetoscreen(monitor1, 1 , 5, "Mercury is nice tooooooooooo", colors.orange)

    button.setMonitor(monitor1)
    button1 = button.create("tor1main")
    button1.setPos(3,11)
    button1.setText("Tor 1")
    button1.setSize(7,5)
    button1.setAlign("center")
    button1.onClickReturn(2)
    button1.setActive(true)

    button2 = button.create("tor2main")
    button2.setPos(12,11)
    button2.setText("Tor 2")
    button2.setSize(7,5)
    button2.setAlign("center")
    button2.onClickReturn(3)
    button2.setActive(true)

    button3 = button.create("tor3main")
    button3.setPos(22,11)
    button3.setText("Tor 3")
    button3.setSize(7,5)
    button3.setAlign("center")
    button3.onClickReturn(4)
    button3.setActive(true)

    button4 = button.create("tor4main")
    button4.setPos(31,11)
    button4.setText("Tor 4")
    button4.setSize(7,5)
    button4.setAlign("center")
    button4.onClickReturn(5)
    button4.setActive(true)

end

function mainloop()
    input = read()

    if input == "help" then
        print("All Commands:")
        print("print main screen: reprints main screen")
        print("stop: stopse the program")
        print("help: this comand")
    end

    if input == "print main screen" then
        prinmainscreenprint()
        print("Main screen printed")
    end

    if input == "print pad1 screen" then
        padscreen1()
        print("pad1 screen printed")
    end


    if input == "stop" then
        print("Program is stoping!!")
        sleep(3)
        stop = true
    end

end

function buttonloop()
    local button = button.await(button1, button2, button3, button4)

    if button == 2 then
        
        if paddorr1 == true then
            paddorr1 = false
            writetoscreenwithoutlog(monitor1, 5 , 17, "Zu ", colors.white)
            rednet.broadcast("zu","paddor1")
        else
            paddorr1 = true
            writetoscreenwithoutlog(monitor1, 5 , 17, "Auf", colors.white)
            rednet.broadcast("auf","paddor1")        
        end
    end

    if button == 3 then
        
        if paddorr2 == true then
            paddorr2 = false
            writetoscreenwithoutlog(monitor1, 14 , 17, "Zu ", colors.white)
            rednet.broadcast("zu","paddor2")
        else
            paddorr2 = true
            writetoscreenwithoutlog(monitor1, 14 , 17, "Auf", colors.white)
            rednet.broadcast("auf","paddor2")        
        end
    end

    if button == 4 then
        
        if paddorr3 == true then
            paddorr3 = false
            writetoscreenwithoutlog(monitor1, 24 , 17, "Zu ", colors.white)
            rednet.broadcast("zu","paddor3")
        else
            paddorr3 = true
            writetoscreenwithoutlog(monitor1, 24 , 17, "Auf", colors.white)
            rednet.broadcast("auf","paddor3")        
        end
    end

    if button == 5 then
        
        if paddorr4 == true then
            paddorr4 = false
            writetoscreenwithoutlog(monitor1, 33 , 17, "Zu ", colors.white)
            rednet.broadcast("zu","paddor4")
        else
            paddorr4 = true
            writetoscreenwithoutlog(monitor1, 33 , 17, "Auf", colors.white)
            rednet.broadcast("auf","paddor4")        
        end
    end
end

function networking()
    senderId, message, protocol = rednet.receive()

    if protocol == "paddor1" then
        if message == "zu" then
            paddorr1 = false
            writetoscreenwithoutlog(monitor1, 5 , 17, "Zu ", colors.white)
        end
        if message == "auf" then
            paddorr1 = true
            writetoscreenwithoutlog(monitor1, 5 , 17, "Auf", colors.white)
        end
    end

    if protocol == "paddor2" then
        if message == "zu" then
            paddorr2 = false
            writetoscreenwithoutlog(monitor1, 14 , 17, "Zu ", colors.white)
        end
        if message == "auf" then
            paddorr2 = true
            writetoscreenwithoutlog(monitor1, 14 , 17, "Auf", colors.white)
        end
    end

    if protocol == "paddor3" then
        if message == "zu" then
            paddorr3 = false
            writetoscreenwithoutlog(monitor1, 24 , 17, "Zu ", colors.white)
        end
        if message == "auf" then
            paddorr3 = true
            writetoscreenwithoutlog(monitor1, 24 , 17, "Auf", colors.white)
        end
    end

    if protocol == "paddor4" then
        if message == "zu" then
            paddorr4 = false
            writetoscreenwithoutlog(monitor1, 33 , 17, "Zu ", colors.white)
        end
        if message == "auf" then
            paddorr4 = true
            writetoscreenwithoutlog(monitor1, 33 , 17, "Auf", colors.white)
        end
    end

end

--- startup code
prinmainscreenprint()
term.clear()
term.setCursorPos(1, 1)
print("plese enter a command")

while true do
    parallel.waitForAny(mainloop, buttonloop, networking)

    if stop == true then
        break
    end

end