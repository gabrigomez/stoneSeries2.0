import QtQuick
import QtQuick.Controls
import QtCore

import "./components/pages" as Pages
import "./components/organisms" as Organisms

ApplicationWindow {
  id: root
  width: 1700
  minimumWidth: 1500
  height: 930
  minimumHeight: 930

  visible: true
  title: qsTr("Stone Series 2.0")

  property var showDetailsResult
  property var searchText
  property var showId
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

  StackView {
    id: stackView
    anchors.fill: parent
    initialItem: Pages.Home {}
  }

  Settings {
    id: settingsConfig
    property string userName: ""
    property string userAvatar: ""
    property var favShowsList: []
  }
}
