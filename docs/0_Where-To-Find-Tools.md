openssl.exe, signtool.exe and osslsigncode.exe are command line tools (no GUI) for Windows, which allow you to execute _cryptographic_ tasks. 

# 1) Where to find OpenSSL?
[OpenSSL](https://openssl-library.org/) is an open source project. Its [source code](https://github.com/openssl/openssl) is available on GitHub, but not the binaries.
There are instructions for compiling binaries for different platforms, including [Windows](https://github.com/openssl/openssl/blob/master/NOTES-WINDOWS.md),
but it is not an easy task. Fortunately, according to the [OpenSSL wiki](https://github.com/openssl/openssl/wiki/Binaries), several sources provide OpenSSL binaries:

- [FireDaemon](https://www.firedaemon.com/download-firedaemon-openssl) provides installers for Windows.<br/>
All the files are signed with a true/valid EV certificate from Sectigo :-)
 
- [Overbyte](https://wiki.overbyte.eu/wiki/index.php/ICS_Download#Download_OpenSSL_Binaries) provides a light and portable (.zip) version.<br/>
All the files are signed with a true/valid certificate from Sectigo :-)

- The [Shining Light Productions](https://slproweb.com/products/Win32OpenSSL.html) provide 2 installers for each realease of OpenSSL.<br/>
The '*Win64 OpenSSL v3.x.x **Light***' is sufficient for what we have to do.<br/>
It is regrettable that no files are signed :-(

Note: The open source project [MSYS2](https://www.msys2.org/) provides a huge number of applications
(mainly from the Linux world) running natively on Windows.
Once MSYS2 is installed, you can install the [openssl package](https://packages.msys2.org/packages/openssl?variant=x86_64) with the command: `pacman -S openssl`<br/>
_This solution is overkill if you just need openssl.exe_

Version used in this documentation:
```
> openssl.exe version
OpenSSL 3.6.0 1 Oct 2025 (Library: OpenSSL 3.6.0 1 Oct 2025)
```
Any openssl version 3.x should work.

# 2.a) Where to find SignTool?

_osslsigncode.exe being a replacement for signtool.exe, you only need one of the two tools._

[SignTool](https://learn.microsoft.com/en-us/windows/win32/seccrypto/signtool) is a proprietary tool provided
by Microsoft in the [Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/).

After installing the SDK 10.0, the path to `signtool.exe` looks like<br/>
`  C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64\signtool.exe`<br/>
Of course, the exact path depends on the specific release of the SDK.

```
> signtool.exe /?
Usage: signtool <command> [options] or signtool @<response file>

  Valid commands:
    sign       --  Sign files using an embedded signature.
    timestamp  --  Timestamp previously-signed files.
    verify     --  Verify embedded or catalog signatures.
    catdb      --  Modify a catalog database.
    remove     --  Remove embedded signature(s) or reduce the size of an embedded signed file.
```
_Note: There is no way to display the version of signtool.exe_

# 2.b) Where to find osslSignCode?

_osslsigncode.exe being a replacement for signtool.exe, you only need one of the two tools._

osslSignCode is an open source replacement for SignTool using the OpenSSL libraries (ssl-3-x64.dll and crypto-3-x64.dll)<br/>
Its [source code](https://github.com/mtrojnar/osslsigncode) and 
[binary](https://github.com/mtrojnar/osslsigncode/releases/latest) are available on GitHub.
```
> osslsigncode.exe --version
osslsigncode 2.10, using:
        OpenSSL 3.1.2 1 Aug 2023 (Library: OpenSSL 3.1.2 1 Aug 2023)
No default -CAfile location detected
Please send bug-reports to Michal.Trojnara@stunnel.org
```
Surprisingly, no files are signed or self-signed (for now?).

<hr/>

### | [🏠](index.md) > [Create your Certificate-Authority ⇒](1_Create-Your-Certification-Authority.md)
