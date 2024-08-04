Set objShell = CreateObject("WScript.Shell")

' Key path
strKeyPath = "HKCU\Software\Google\Settings\{324214-j21p11-228d23-131d2d}" ' Random Key Path
strValueName = "State" ' Key name

' Checking key
On Error Resume Next
strValue = objShell.RegRead(strKeyPath & "\" & strValueName)
On Error Goto 0

If strValue <> "" Then
    MsgBox "Blya okey, Trusted!", vbInformation, "Trusted"
Else
   MsgBox "Error when launching the application (0xc0150024)To exit the application, click the 'OK' button", vbCritical, "Untrusted"
End If