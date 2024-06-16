import QtQuick
import QtQuick.Controls

Menu {
  id: optionsMenu
  x: 4
  y: 60

  Action {
    text: qsTr("Meus favoritos")
    onTriggered: stackView.push("../pages/FavShows.qml")
  }

  Action {
    text: qsTr("Configurações")
    onTriggered: stackView.push("../pages/Settings.qml")
  }

  Action {
    text: qsTr("Sobre")
    onTriggered: Qt.openUrlExternally(
                   "https://github.com/gabrigomez/stoneSeries2.0")
  }
}
