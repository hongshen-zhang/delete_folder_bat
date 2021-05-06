@echo off
setlocal enabledelayedexpansion

:: 增加删除文件请修改该参数取值
SET Obj_Length=3
 
:: 增加删除文件请按照如下格式增加文件名
SET Obj[0].Name= 文档1
SET Obj[0].Value= "D:\soma3"
 
SET Obj[1].Name= 文档2
SET Obj[1].Value= "D:\Qingfeng"

SET Obj[2].Name= 文档3
SET Obj[2].Value= "D:\IQIYI Video"


:: 主程序
SET Obj_Index=0
 
:LoopStart
IF %Obj_Index% EQU %Obj_Length% GOTO :EOF
 
SET Obj_Current.Name=0
SET Obj_Current.Value=0

FOR /F "usebackq delims==. tokens=1-3" %%I IN (`SET Obj[%Obj_Index%]`) DO (
  SET Obj_Current.%%J=%%K
)
 

@echo ----------------------------------------------------------------------------
@echo 删除文件 %Obj_Current.Name%
del /f /s /q %Obj_Current.Value%\*.*

@echo ----------------------------------------------------------------------------
@echo 删除文件夹 %Obj_Current.Name%
for /f "delims=" %%a in ('dir /ad /b /s %Obj_Current.Value%\^|sort /r') do (
  rd "%%a">nul 2>nul &&echo 空目录"%%a"成功删除！
)

SET /A Obj_Index=%Obj_Index% + 1

:: 如果不想要按回车继续，可以删除下行代码 pause 即可
pause

ECHO. 
GOTO LoopStart

)