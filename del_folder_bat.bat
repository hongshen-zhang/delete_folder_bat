@echo off
setlocal enabledelayedexpansion

:: ����ɾ���ļ����޸ĸò���ȡֵ
SET Obj_Length=3
 
:: ����ɾ���ļ��밴�����¸�ʽ�����ļ���
SET Obj[0].Name= �ĵ�1
SET Obj[0].Value= "D:\soma3"
 
SET Obj[1].Name= �ĵ�2
SET Obj[1].Value= "D:\Qingfeng"

SET Obj[2].Name= �ĵ�3
SET Obj[2].Value= "D:\IQIYI Video"


:: ������
SET Obj_Index=0
 
:LoopStart
IF %Obj_Index% EQU %Obj_Length% GOTO :EOF
 
SET Obj_Current.Name=0
SET Obj_Current.Value=0

FOR /F "usebackq delims==. tokens=1-3" %%I IN (`SET Obj[%Obj_Index%]`) DO (
  SET Obj_Current.%%J=%%K
)
 

@echo ----------------------------------------------------------------------------
@echo ɾ���ļ� %Obj_Current.Name%
del /f /s /q %Obj_Current.Value%\*.*

@echo ----------------------------------------------------------------------------
@echo ɾ���ļ��� %Obj_Current.Name%
for /f "delims=" %%a in ('dir /ad /b /s %Obj_Current.Value%\^|sort /r') do (
  rd "%%a">nul 2>nul &&echo ��Ŀ¼"%%a"�ɹ�ɾ����
)

SET /A Obj_Index=%Obj_Index% + 1

:: �������Ҫ���س�����������ɾ�����д��� pause ����
pause

ECHO. 
GOTO LoopStart

)