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
  color: "black"

  wrapMode: Text.Wrap
  font.pixelSize: 16
  clip: true
  horizontalAlignment: Text.AlignJustify
}
