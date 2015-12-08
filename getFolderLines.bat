:: This batch file counts lines of code in a folder and all it's subfolder
setlocal
set /a totalNumLines = 0
:: put a space delimited list of file name filter in the IN after the for to filter to specific files.  
for /r %1 %%F in (*.cfm *.cfml *.cfc *.js *.html *.htm *.txt *.sql *.css) do (
  for /f %%N in ('find /v /c "" ^<"%%F"') do (
	 set /a totalNumLines+=%%N
	 :: reporting file level lines, only reports about file with textual data, binary files will show empty string
	 :: using .rpt instead of .txt extenstion because it is most likely not used by anything else.
	 echo Total number of lines in file %%F are %%N >>folderReport.rpt
	)
)

:: reporting total lines the folder
echo Total number of code lines in the folder is %totalNumLines% >>folderReport.rpt
