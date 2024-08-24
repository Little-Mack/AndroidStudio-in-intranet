REM Меняем кодировку окна консоли на UTF-8
chcp 65001 
REM Путь до папки в которую будут скопированы файлы
set pathAndroidStudio=C:\AndroidSettings\

REM Если папка исполнения скрипта - это сетевой путь, то подключаем его как сетевой диск
pushd "%~dp0"

REM Копируем папки\файлы на диск C:\
robocopy .android %pathAndroidStudio%.android\ /tbd /mt:16 /z /mir
robocopy Sdk %pathAndroidStudio%Sdk\ /tbd /mt:16 /z /mir
robocopy Gradle %pathAndroidStudio%Gradle\ /tbd /mt:16 /z /mir
robocopy init.d %pathAndroidStudio%Gradle\init.d\ /tbd /mt:16 /z /mir

REM Запонимаем записи в Path
set tempPath=%Path%
cd /d "%windir%\system32"

REM Прописываем переменные в систему 
setx /m ANDROID_SDK_HOME %pathAndroidStudio%
setx /m ANDROID_SDK_ROOT %pathAndroidStudio%Sdk
setx /m GRADLE_HOME %pathAndroidStudio%Gradle
setx /m GRADLE_USER_HOME %pathAndroidStudio%Gradle
setx /m Path "%tempPath%%pathAndroidStudio%Gradle\bin;"

Pause