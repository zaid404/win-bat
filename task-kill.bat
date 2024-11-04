@echo off
REM Membersihkan file sementara
del tasklist.txt
setlocal

REM Daftar tugas (tasklist)
tasklist /fi "imagename ne explorer.exe" /fi "imagename ne taskmgr.exe" /fi "imagename ne cmd.exe" /fi "imagename ne conhost.exe" /fi "imagename ne System Idle Process" /fi "imagename ne System" /fi "imagename ne smss.exe" /fi "imagename ne csrss.exe" /fi "imagename ne wininit.exe" /fi "imagename ne services.exe" /fi "imagename ne lsass.exe" /fi "imagename ne lsm.exe" /fi "imagename ne svchost.exe" /fi "imagename ne winlogon.exe" /fi "imagename ne spoolsv.exe" /fi "imagename ne taskhost.exe" /fi "imagename ne taskeng.exe" /fi "imagename ne dwm.exe" /fi "imagename ne SearchIndexer.exe" /fi "imagename ne sppsvc.exe" /fi "imagename ne WmiPrvSE.exe" /fi "imagename ne audiodg.exe" /fi "imagename ne OSPPSVC.EXE" /fi "imagename ne SearchProtocolHost.exe" /fi "imagename ne SearchFilterHost.exe" /fi "imagename ne cmd.exe" /fi "imagename ne conhost.exe" /fi "imagename ne tasklist.exe" /fi "imagename ne WUDFHost.exe" /fi "imagename ne svchost.exe" /fi "imagename ne igfxtray.exe" /fi "imagename ne hkcmd.exe" /fi "imagename ne igfxpers.exe" /fi "imagename ne SynTPEnh.exe" /fi "imagename ne SynTPHelper.exe" /fi "imagename ne igfxsrvc.exe.exe" /fo csv > tasklist.txt

REM Menghentikan (kill) semua tugas yang tidak terkait dengan Windows OS
for /f "skip=1 tokens=1 delims=," %%A in (tasklist.txt) do (
    taskkill /PID %%A /F
)

echo Semua tugas yang tidak berhubungan dengan Windows OS telah dihentikan.

endlocal
netsh interface set interface "Wireless Network Connection" admin=disable
netsh interface set interface "Wireless Network Connection" admin=enable
