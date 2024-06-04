import QtQuick
import QtQuick.Controls

ApplicationWindow {
  id: root
  width: 640
  minimumWidth: 500
  height: 480
  minimumHeight: 480

  visible: true
  title: qsTr("Stone Series 2.0")
  color: "#A9DFBF"

  header: Navbar {}

  StackView {
    id: stackView
    anchors.fill: parent
    initialItem: Home {}
  }
}
