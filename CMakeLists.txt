cmake_minimum_required(VERSION 3.16)

project(Alarme VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS
    Core
    Gui
    Qml
    Quick
)

qt_add_resources(RESOURCES
    resources/resources.qrc
)

add_executable(Alarme
    src/main.cpp
    src/AlarmManager.cpp
    src/AlarmManager.h
    ${RESOURCES}
)

target_link_libraries(Alarme PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
)