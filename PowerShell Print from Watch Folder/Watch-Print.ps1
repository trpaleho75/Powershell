#$watchPath = "C:\Users\holttr\Desktop\print\*.*"
$watchPath = "\\10.10.30.119\c$\Users\qqg34519\Desktop\print\*.*"

do
{
	$check = (Test-Path -Path $watchPath -ErrorAction SilentlyContinue)
	if($check){
		$files = Get-ChildItem -Path $watchPath
		ForEach ($file in $files)
		{
			Start-Process -FilePath $file.PSPath -Verb print -Wait
			Remove-Item -Path $file.PSPath
		}
	}
	Start-Sleep -Seconds 10
} while ($true)