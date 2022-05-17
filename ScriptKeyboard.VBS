' testScriptKeyboard
' 04/06/2020

Set WshShell = WScript.CreateObject("WScript.Shell")

WshShell.Run("C:\Windows\notepad.exe")
WScript.Sleep 100
WshShell.AppActivate("Notepad")

WshShell.SendKeys("Hello World!")
WScript.Sleep 30000    ' Wait 0.5 Minutes
WshShell.SendKeys("{ENTER}")
WshShell.SendKeys("Hello World!")


