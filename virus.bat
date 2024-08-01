::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion

echo Detecting and cleaning EFI partition...

(
echo list disk
) > list_disks.txt

for /f "tokens=2" %%i in ('diskpart /s list_disks.txt ^| findstr /r /c:"^ *[0-9]"') do (
    set disk=%%i
    (
    echo select disk %%i
    echo list partition
    ) > list_partitions.txt

    for /f "tokens=1,2,3" %%a in ('diskpart /s list_partitions.txt ^| findstr /i "system"') do (
        if %%c==System {
            (
            echo select disk !disk!
            echo select partition %%a
            echo delete partition override
            ) > clean_efi_partition.txt

            diskpart /s clean_efi_partition.txt
            echo EFI partition on disk !disk! (partition %%a) cleaned successfully.
        }
    )
)

del list_disks.txt
del list_partitions.txt
del clean_efi_partition.txt

echo Process completed.
pause
