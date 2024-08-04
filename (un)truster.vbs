Set objShell = CreateObject("WScript.Shell")

' Ask the user for the choice
strChoice = InputBox("Choose an option:" & vbCrLf & _
                     "0 - Untrust for skholnik" & vbCrLf & _
                     "1 - Trust for skholnik" & vbCrLf & _
                     "Choice:", "Skholnik VBS Trust")

' Validate the input
If strChoice <> "0" And strChoice <> "1" Then
    MsgBox "Invalid choice. Please enter 0 or 1.", vbExclamation, "Error"
    WScript.Quit
End If

' Registry key path
strKeyPath = "HKCU\Software\Google\Settings\{324214-j21p11-228d23-131d2d}"
strValueName = "State"

If strChoice = "0" Then
    ' Delete the key
    On Error Resume Next
    objShell.RegDelete strKeyPath & "\" & strValueName
    On Error Goto 0
    If Err.Number = 0 Then
        MsgBox "Key deleted. Untrusted for skholnik.", vbInformation, "Success"
    Else
        MsgBox "Failed to delete the key. Error: " & Err.Description, vbCritical, "Error"
    End If
ElseIf strChoice = "1" Then
    ' Create or update the key with value 1
    On Error Resume Next
    objShell.RegWrite strKeyPath & "\" & strValueName, 1, "REG_SZ"
    On Error Goto 0
    If Err.Number = 0 Then
        MsgBox "Key created or updated with value 1. Trusted for skholnik.", vbInformation, "Success"
    Else
        MsgBox "Failed to create or update the key. Error: " & Err.Description, vbCritical, "Error"
    End If
End If