import QtQuick
import QtQuick.Controls.Material 2.12

import "../organisms" as Organisms

Rectangle {
  id: celebrityDetails
  width: parent?.width
  height: parent?.height
  color: "white"

  property var name
  property var image
  property var birthday
  property var deathday
  property var country

  BusyIndicator {
    id: busyIndicator
    visible: celebrityImage.status === 1 ? false : true
    anchors.centerIn: parent

    width: 281
    height: 281
    Material.accent: settingsConfig.themeColor
  }

  Organisms.CelebrityDetailsInfo {}

  Component.onCompleted: {
    apiController.fetchCelebrityDetails(celebrity_id)
  }

  Connections {
    target: apiController
    function onCelebrityDetailsFetched(details) {
      celebrityDetails.name = details.name
      celebrityDetails.image = details.image?.original
      celebrityDetails.birthday = details.birthday
      celebrityDetails.deathday = details.deathday
      celebrityDetails.country = details.country?.name
    }

    function onErrorOccurred(errorString) {
      console.error("Error:", errorString)
    }
  }
}
