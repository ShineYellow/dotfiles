
hs.hotkey.bind({"alt"}, "Q", function()
  hs.console.clearConsole()
  hs.alert.show("Hammerspoon Exiting")
  hs.timer.doAfter(0.5, function() hs.application.applicationForPID(hs.processInfo["processID"]):kill() end)
end)
