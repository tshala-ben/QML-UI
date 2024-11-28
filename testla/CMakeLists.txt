cmake_minimum_required(VERSION 3.16)

project(testla VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(apptestla
    main.cpp
)

qt_add_qml_module(apptestla
    URI testla
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES UI/BottomBar/BottomBar.qml
        QML_FILES UI/RightScreen/RightScreen.qml
        QML_FILES UI/LeftScreen/LeftScreen.qml
        RESOURCES
        RESOURCES UI/assets/carRender.png
        RESOURCES UI/assets/carRender.png
        RESOURCES UI/assets/carRender.png
        RESOURCES UI/assets/carRender.png
        RESOURCES UI/assets/tes.jpg
        RESOURCES UI/assets/car.jpg
        RESOURCES UI/assets/car2.png
        SOURCES
        SOURCES Controllers/system.h Controllers/system.cpp
        RESOURCES UI/assets/lock1.png UI/assets/unlock3.png
        QML_FILES
        RESOURCES UI/assets/searchIcon1.webp
        SOURCES Controllers/hvachandler.h Controllers/hvachandler.cpp
        QML_FILES UI/BottomBar/HVACcomponent.qml
        RESOURCES UI/assets/audio1.png UI/assets/audio2.png UI/assets/audio3.png
        SOURCES Controllers/audioontroller.h Controllers/audioontroller.cpp
        QML_FILES UI/BottomBar/volumeControlComponent.qml
        RESOURCES UI/assets/audio1.png UI/assets/audio2.png UI/assets/audio3.png
        RESOURCES UI/assets/white1.png
        RESOURCES UI/assets/white0.png
        RESOURCES UI/assets/white2.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptestla PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptestla
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptestla
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS apptestla
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
