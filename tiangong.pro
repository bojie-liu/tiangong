#-------------------------------------------------
#
# Project created by QtCreator 2018-10-28T20:46:05
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = tiangong
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

CONFIG += c++11

SOURCES += \
        main.cpp \
        mainwindow.cpp

HEADERS += \
        mainwindow.h

FORMS += \
        mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

# Binding config
PYTHON_BINDING = true
PYTHON_VERSION = 3.7
PYTHON_HOME = $$PWD/../../../../../../../Library/Frameworks/Python.framework/Versions/$${PYTHON_VERSION}/
PYTHONQT_HOME = /Users/joshualiu/dev/env/PythonQt3.2/
PYTHONQT_LIB = PythonQt-Qt5-Python3.7.3.2.0

$${PYTHON_BINDING} {
    message(Adding python binding)
    INCLUDEPATH += $${PYTHON_HOME}/include/python$${PYTHON_VERSION}m $${PYTHONQT_HOME}/src/
    DEPENDPATH += $${PYTHON_HOME}/include/python$${PYTHON_VERSION}m $${PYTHONQT_HOME}/src/
    LIBS += -L$${PYTHONQT_HOME}/lib/ -L$${PYTHONQT_HOME}/lib/
    QMAKE_LFLAGS += -l$${PYTHONQT_LIB}
    message(QMAKE_LFLAGS $${QMAKE_LFLAGS})
    message(QMAKE_CFLAGS $${QMAKE_CFLAGS})
}


#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../env/PythonQt3.2/lib/release/ -lPythonQt_QtAll-Qt5-Python3.7_d.3.2.0
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../env/PythonQt3.2/lib/debug/ -lPythonQt_QtAll-Qt5-Python3.7_d.3.2.0
#else:unix: LIBS += -L$$PWD/../../../../env/PythonQt3.2/lib/ -lPythonQt_QtAll-Qt5-Python3.7_d.3.2.0
#else:macx:

