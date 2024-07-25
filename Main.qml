import QtQuick
import QtQuick.Controls
import QtCore
import Stone 2.0

import "./components/pages" as Pages
import "./components/organisms" as Organisms

ApplicationWindow {
  id: root
  width: 1700
  minimumWidth: 1600
  height: 930
  minimumHeight: 930

  visible: true
  title: qsTr("Stone Series 2.0")

  //TODO: change celebrity_id
  property var showId
  property var celebrity_id
  property var busy

  FontLoader {
    id: bodyFont
    source: "fonts/Cafe.ttf"
  }

  FontLoader {
    id: titleFont
    source: "fonts/Riffic.ttf"
  }

  header: Organisms.Navbar {}

  SearchController {
    id: searchController
  }

  ApiController {
    id: apiController
  }

  StackView {
    id: stackView
    anchors.fill: parent
    initialItem: Pages.Home {}
  }

  Settings {
    id: settingsConfig
    property string userName: ""
    property string userAvatar: ""
    property string themeColor: "#27AE60"
    property string navBarColor: "#27AE60"
    property var favShowsList: []
  }
}
