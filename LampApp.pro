QT       += core
QT       += gui
QT       += network quick qml quickwidgets
QT += concurrent


TEMPLATE = app


# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17
DEFINES += QT_DEPRECATED_WARNINGS
CONFIG -= app_bundle



# Ваши исходные файлы
SOURCES += \
    bulb.cpp \
    bulbcontroller.cpp \
    colorpicker.cpp \
    main.cpp \
    widget.cpp

HEADERS += \
    bulb.h \
    bulbcontroller.h \
    colorpicker.h \
    widget.h


# Правила деплоя
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    ControllerWindow.qml

RESOURCES += \
    qml.qrc \
    qml.qrc
