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
        RESOURCES fonts/Riffic.ttf
        RESOURCES assets/searchIcon.png
        RESOURCES assets/OnAir.png
        RESOURCES assets/GoldStar.png
        RESOURCES assets/Logo.png
        RESOURCES assets/BackIcon.png
        RESOURCES assets/CalendarIcon.png
        RESOURCES assets/NotFound.png
        RESOURCES assets/UploadImage.png
        RESOURCES assets/Theme.png
        RESOURCES assets/TrashIcon.png
        RESOURCES assets/Rating.png
        RESOURCES assets/TrendIcon.png
        RESOURCES assets/Ended.png
        RESOURCES assets/Doubt.png
        RESOURCES assets/ImdbLogo.png
        RESOURCES assets/Birthday.png
        RESOURCES assets/Deathday.png
        RESOURCES assets/BornAt.png
        RESOURCES assets/NoResult.png
        QML_FILES components/organisms/InfoCard.qml
        QML_FILES components/atoms/TrendingIcon.qml
        QML_FILES components/molecules/TrendingHeader.qml
        QML_FILES components/molecules/Search.qml
        QML_FILES components/atoms/TrendingTitle.qml
        QML_FILES components/organisms/TrendingCards.qml
        QML_FILES components/atoms/LogoIcon.qml
        QML_FILES components/atoms/UserNameInfo.qml
        QML_FILES components/atoms/AppTitle.qml
        QML_FILES components/organisms/UserOptions.qml
        QML_FILES components/organisms/Navbar.qml
        QML_FILES components/pages/FavShows.qml
        QML_FILES components/pages/Home.qml
        QML_FILES components/pages/NotFound.qml
        QML_FILES components/pages/Results.qml
        QML_FILES components/pages/Settings.qml
        QML_FILES components/pages/ShowDetails.qml
        QML_FILES components/atoms/ShowImage.qml
        QML_FILES components/atoms/ShowTitle.qml
        QML_FILES components/atoms/ShowRating.qml
        QML_FILES components/atoms/AvatarImage.qml
        QML_FILES components/atoms/Mask.qml
        QML_FILES components/molecules/UserOptionsActions.qml
        QML_FILES components/atoms/UserOptionsBackground.qml
        QML_FILES components/molecules/NoFavListShow.qml
        QML_FILES components/atoms/NotFoundDescription.qml
        QML_FILES components/atoms/NotFoundImage.qml
        QML_FILES components/atoms/SettingsTitle.qml
        QML_FILES components/organisms/SettingsCard.qml
        QML_FILES components/atoms/SettingsAvatar.qml
        QML_FILES components/atoms/SettingsUserName.qml
        QML_FILES components/atoms/EditUserNameLabel.qml
        QML_FILES components/atoms/EditUserNameInput.qml
        QML_FILES components/atoms/SaveSettingsButton.qml
        QML_FILES components/atoms/ErrorMessage.qml
        QML_FILES components/organisms/ShowDetailsDescriptionCard.qml
        QML_FILES components/organisms/ShowDetailsInfo.qml
        QML_FILES components/atoms/ShowDetailsImage.qml
        QML_FILES components/atoms/ShowDetailsTitle.qml
        QML_FILES components/molecules/GenresInfo.qml
        QML_FILES components/atoms/ShowDetailsRating.qml
        QML_FILES components/atoms/CalendarIcon.qml
        QML_FILES components/molecules/ShowDetailsYears.qml
        QML_FILES components/molecules/ShowDetailsDescription.qml
        QML_FILES components/atoms/SinopseTitle.qml
        QML_FILES components/atoms/SinopseDescription.qml
        QML_FILES components/molecules/UserAvatarCard.qml
        QML_FILES components/molecules/SettingsImageLoaderButton.qml
        QML_FILES components/atoms/SettingsImageLoaderIcon.qml
        QML_FILES components/molecules/ThemeButton.qml
        QML_FILES components/molecules/FavShowButton.qml
        QML_FILES components/atoms/RatingIcon.qml
        SOURCES controllers/searchcontroller.h controllers/searchcontroller.cpp
        SOURCES controllers/apicontroller.h controllers/apicontroller.cpp
        QML_FILES components/molecules/FavCount.qml
        QML_FILES components/atoms/ShowDetailsStatus.qml
        QML_FILES components/molecules/ImdbButton.qml
        QML_FILES components/molecules/SearchIcon.qml
        QML_FILES components/organisms/CastCard.qml
        QML_FILES components/molecules/CelebrityCard.qml
        QML_FILES components/pages/CelebrityDetails.qml
        QML_FILES components/molecules/CelebrityShow.qml
        QML_FILES components/organisms/CelebrityShowsList.qml
        QML_FILES components/molecules/NoShows.qml
        QML_FILES components/molecules/CelebrityInfoContainer.qml
        QML_FILES components/organisms/CelebrityDetailsInfoCard.qml
        QML_FILES components/templates/CelebrityDetailsTemplate.qml
        QML_FILES components/templates/FavShowsTemplate.qml
        QML_FILES components/templates/HomeTemplate.qml
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
