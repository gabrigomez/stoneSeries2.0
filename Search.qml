import QtQuick
import QtQuick.Controls

Rectangle {
  id: search
  width: 200
  height: 40

  TextField {
    id: searchInput
    anchors.fill: parent

    placeholderText: "Digite sua pesquisa"
    focus: true

    onAccepted: () => {
                  //console.log(searchInput.text)
                  searchText = searchInput.text
                  stackView.push("pages/Results.qml")
                }

    Keys.onEscapePressed: () => {
                            stackView.push("Home.qml")
                          }
  }
}
