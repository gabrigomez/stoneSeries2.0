import QtQuick

import "../organisms" as Organisms

Item {
  id: showDetailsTemplateContainer

  property string favButtonText
  property string favButtonBg
  property var castData

  anchors.fill: parent

  Organisms.ShowDetailsInfo {
    id: showDetailsCard
  }

  Organisms.ShowDetailsDescriptionCard {
    id: showDescriptionCard
    favButtonText: showDetailsTemplateContainer.favButtonText
    favButtonBgColor: showDetailsTemplateContainer.favButtonBg
    castModelData: showDetailsTemplateContainer.castData
  }
}
