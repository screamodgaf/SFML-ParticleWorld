TEMPLATE = app
CONFIG += console c++17
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        button.cpp \
        fire.cpp \
        main.cpp \
        oil.cpp \
        particle.cpp \
        sand.cpp \
        smoke.cpp \
        water.cpp \
        wood.cpp \
        world.cpp

QMAKE_CXXFLAGS += -O3 -finline-small-functions -momit-leaf-frame-pointer -pthread
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O3

QMAKE_LFLAGS_RELEASE -= -O1


HEADERS += \
    button.h \
    fire.h \
    oil.h \
    particle.h \
    sand.h \
    smoke.h \
    water.h \
    wood.h \
    world.h



INCLUDEPATH += $$PWD/../SFML-2.6.1/SFML-2.6.1/include
DEPENDPATH += $$PWD/../SFML-2.6.1/SFML-2.6.1/build

unix|win32: LIBS += -L$$PWD/../SFML-2.6.1/SFML-2.6.1/build/lib/ -lsfml-system
unix|win32: LIBS += -L$$PWD/../SFML-2.6.1/SFML-2.6.1/build/lib/ -lsfml-graphics
unix|win32: LIBS += -L$$PWD/../SFML-2.6.1/SFML-2.6.1/build/lib/ -lsfml-window

