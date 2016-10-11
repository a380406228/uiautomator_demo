set SDK_TOOLS_PATH=D:\Android\sdk\tools
set TEST_CODE_PATH=E:\EclipseWorkSpace\testuiauto
set JAR_NAME=UiAutomator
set TEST_CASE_CLASS=com.UIAutomator.TestDemo


d:
cd %SDK_TOOLS_PATH%
call android create uitest-project -n %JAR_NAME% -t 7 -p E:\EclipseWorkSpace\testuiauto
echo generate %JAR_NAME%.xml

e:
cd %TEST_CODE_PATH%
call ant build
echo generate %TEST_CODE_PATH%\bin\%JAR_NAME%.jar 

e:
cd %TEST_CODE_PATH%
call adb push bin\%JAR_NAME%.jar data/local/tmp
call adb shell uiautomator runtest %JAR_NAME%.jar -c %TEST_CASE_CLASS%
echo Test Done!

