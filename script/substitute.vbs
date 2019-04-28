Set objFS=CreateObject("Scripting.FileSystemObject")
strOld = Replace(WScript.Arguments.Item(0), "'", """")
strNew = Replace(WScript.Arguments.Item(1), "'", """")
strFile = WScript.Arguments.Item(2)
Set objFile = objFS.OpenTextFile(strFile)
Set stdout = objFS.GetStandardStream (1)

Do Until objFile.AtEndOfStream
   strLine = objFile.ReadLine
   stdout.WriteLine Replace(strLine,strOld,strNew)
Loop
