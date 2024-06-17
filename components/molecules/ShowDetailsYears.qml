import QtQuick

Row {
  anchors {
    bottom: calendarIcon.bottom
    bottomMargin: 2
    left: calendarIcon.right
    leftMargin: 4
  }

  spacing: 4
  Text {
    id: showStartYear
    text: startYear ? startYear : ""
    color: "white"

    style: Text.Outline
    styleColor: "black"
    font.pixelSize: 16
  }

  Text {
    text: "-"
    color: "white"

    style: Text.Outline
    styleColor: "black"
    font.pixelSize: 12
  }

  Text {
    id: showEndYear
    text: endYear ? endYear : ""
    color: "white"

    style: Text.Outline
    styleColor: "black"
    font.pixelSize: 16
  }
}
