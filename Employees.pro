TEMPLATE = app

QT += qml quick quickcontrols2 widgets  sql

CONFIG += c++11

TARGET = PERSONELLE

SOURCES += main.cpp \
     sources/salesman.cpp \
    sources/contract.cpp \
       sources/database.cpp \
    sources/listmodel.cpp
    

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

android:
    {
DISTFILES += \
    Images/Attendance-Monitoring560.png \
    Images/Corporate Management.png \
    Images/add.png \
    Images/cancel.png \
    Images/cpp.png \
    Images/css.png \
    Images/edit.png \
    Images/exit.png \
    Images/icon.png \
    Images/ok.png \
    Images/qt.png \
    Images/remove.png \
    Images/sqlite.jpg \
    Images/trolley.png \
    Images/user_add.png \
    Images/user_edit.png \
    Images/user_menu.png \
    Images/user_ok.png \
    Images/user_remove.png \
    Images/users.png \
    Staff.db \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    backend.js \
    docs/Doxyfile \
    screenshots/Screenshot_20230119-164507.png \
    screenshots/Screenshot_20230119-164528.png \
    screenshots/Screenshot_20230119-164540.png \
    screenshots/Screenshot_20230119-164550.png \
    screenshots/Screenshot_20230119-164604.png \
    screenshots/Screenshot_20230119-164652.png
android: include(C:/Users/pc/AppData/Local/Android/Sdk/android_openssl/openssl.pri)

!android:
    {
        # copie la base de données dans le dossier build
        CONFIG += file_copies
        COPIES += bd
        bd.files = Staff.db
        bd.path = $$OUT_PWD/
        bd.base = $$PWD/
    }
contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
        deployment.files += Staff.db
        deployment.path = /assets/db
        INSTALLS += deployment
}

HEADERS += \
    headers/contract.h \
    headers/database.h \
    headers/listmodel.h   \
    headers/salesman.h
    

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
        deployment.files += Staff.db
        deployment.path = /assets/db
        INSTALLS += deployment
}

}
