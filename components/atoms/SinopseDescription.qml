import QtQuick

Text {
  id: sinopseDescription
  width: 480
  height: contentHeight

  anchors {
    top: sinopseTitle.bottom
    left: showDetailsSummary.left
    topMargin: 10
    leftMargin: 2
  }

  text: showDetails?.description ? showDetails.description : "Sem descrição"
  color: "white"
  style: Text.Outline
  styleColor: "black"

  font.pixelSize: 16
  horizontalAlignment: Text.AlignJustify
  wrapMode: Text.Wrap
  clip: true
}
