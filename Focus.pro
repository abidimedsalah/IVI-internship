TEMPLATE = app

QT += qml quick widgets dbus

SOURCES += main.cpp

RESOURCES += qml.qrc \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    Media_bluetooth.h \
    Ofono_bluetooth.h