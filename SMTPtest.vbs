'WScript.Echo "Uncomment to test if VBScript works."
Set oMail = CreateObject("CDO.Message")
oMail.To = "first.last@example.net"
oMail.Subject = "Test message from SERVER 2022-12-31 23:59"
oMail.TextBody = "This has been a test message."
oMail.From = "noreply@example.net"

oMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 ' cdoSendUsingPort
oMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.example.net"
'oMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = 1
oMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
'oMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
'oMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "p@ssw0rD"
'oMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "noreply@example.net"
oMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10

oMail.Configuration.Fields.Update
oMail.Send
Set oMail = Nothing
