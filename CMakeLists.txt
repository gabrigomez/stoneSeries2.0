cmake_minimum_required(VERSION 3.16)

project(StoneSeries2 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appStoneSeries2
    main.cpp
)

qt_add_qml_module(appStoneSeries2
    URI StoneSeries2
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES fonts/Cafe.ttf
        RESOURCES fonts/Lemon.ttf
        RESOURCES assets/searchIcon.png
        RESOURCES assets/GoldStar.png
        RESOURCES assets/Logo.png
        RESOURCES assets/BackIcon.png
        RESOURCES assets/GenresIcon.png
        RESOURCES assets/CalendarIcon.png
        RESOURCES assets/Settings.png
        RESOURCES assets/NotFound.png
        QML_FILES Navbar.qml        
        QML_FILES Search.qml
        QML_FILES pages/Home.qml
        QML_FILES pages/Results.qml
        QML_FILES pages/Show.qml
        QML_FILES pages/NotFound.qml
        QML_FILES pages/Settings.qml
        QML_FILES pages/FavShows.qml
        QML_FILES Api.js
        QML_FILES components/ShowCard.qml        
        QML_FILES components/atoms/TrendingIcon.qml
        QML_FILES components/molecules/TrendingCard.qml
        QML_FILES components/atoms/TrendingTitle.qml
        QML_FILES components/organisms/HomeCard.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appStoneSeries2 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appStoneSeries2
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appStoneSeries2
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appStoneSeries2
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
