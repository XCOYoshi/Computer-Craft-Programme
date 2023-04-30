-- to run you need to install https://pastebin.com/pFHeia96

os.pullEvent = os.pullEventRaw -- prevent termination

os.loadAPI("button.lua") 

local stop = false

local modem = peripheral.wrap("back")-- Modem init
modem.open(15) -- Modem conect
local monitor1 = peripheral.wrap("monitor_0")    -- Monitor 1 init
local monitor2 = peripheral.wrap("monitor_1")
local paddorr1



function writetoscreen (screen, positon, line, text, color, scale)
    screen.setCursorPos(positon, line)
    screen.setTextColor(color)
    screen.write(text)
    print("line " .. line .." was printet")
end

function writetoscreenwithoutlog (screen, positon, line, text, color, scale)
    screen.setCursorPos(positon, line)
    screen.clearLine()  
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
    button1.setPos(5,8)
    button1.setText("Tor")
    button1.onClickReturn(12)
    button1.setActive(true)
    
end

function padscreen1()

    monitor2.clear()    
    monitor2.setTextScale(1)
 

    button.setMonitor(monitor2)
    button2 = button.create("tor1pad")
    button2.setPos(2,2)
    button2.setText("Tor")
    button2.setSize(5,3)
    button2.setAlign("center")
    button2.onClickReturn(11)
    button2.setActive(true)


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
    local button = button.await(button1, button2)

    if button == 11 then
        
        if paddorr1 == true then
            paddorr1 = false
            writetoscreenwithoutlog(monitor2, 3 , 5, "Zu", colors.white)
        else
            paddorr1 = true
            writetoscreenwithoutlog(monitor2, 3 , 5, "Auf", colors.white)        
        end
    end

    if button == 22 then
        print("click")
    end

end

--- startup code
prinmainscreenprint()
padscreen1()
term.clear()
term.setCursorPos(1, 1)
print("plese enter a command")

while true do
    input = parallel.waitForAny(mainloop, buttonloop)
    if stop == true then
        break
    end

end


