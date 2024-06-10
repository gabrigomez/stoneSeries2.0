import QtQuick
import QtQuick.Controls

ApplicationWindow {
  id: root
  width: 640
  minimumWidth: 500
  height: 930
  minimumHeight: 930

  visible: true
  title: qsTr("Stone Series 2.0")

  //color: "#A9DFBF"
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
    source: "fonts/Lemon.ttf"
  }

  header: Navbar {}

  StackView {
    id: stackView
    anchors.fill: parent
    initialItem: Home {}
  }
}
