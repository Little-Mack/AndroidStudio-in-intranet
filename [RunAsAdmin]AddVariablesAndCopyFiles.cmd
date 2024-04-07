chcp 65001 
REM Путь до папки в которую будут скопированы файлы
set pathAndroidStudio=C:\AndroidSettings\

REM Копируем папки\файлы на диск C:\
robocopy %~dp0.android %pathAndroidStudio%.android\ /tbd /mt:16 /z /compress /mir
robocopy %~dp0Sdk %pathAndroidStudio%Sdk\ /tbd /mt:16 /z /compress /mir
robocopy %~dp0Gradle %pathAndroidStudio%Gradle\ /tbd /mt:16 /z /compress /mir
robocopy %~dp0init.d %pathAndroidStudio%Gradle\init.d\ /tbd /mt:16 /z /compress /mir

REM Прописываем переменные в систему
pushd "%~dp0" 
start setenv\setenv.exe -m ANDROID_SDK_HOME %pathAndroidStudio%
start setenv\setenv.exe -m ANDROID_SDK_ROOT %pathAndroidStudio%Sdk
start setenv\setenv.exe -m GRADLE_HOME %pathAndroidStudio%Gradle
start setenv\setenv.exe -m GRADLE_USER_HOME %pathAndroidStudio%Gradle
start setenv\setenv.exe -m Path %pathAndroidStudio%Gradle\bin

Pause