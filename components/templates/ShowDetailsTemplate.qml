import QtQuick

import "../organisms" as Organisms

Item {
  id: showDetailsTemplateContainer
  anchors.fill: parent

  property string favButtonText
  property string favButtonBg
  property var castData

  Organisms.ShowDetailsInfo {
    id: showDetailsCard
  }

  Organisms.ShowDetailsDescriptionCard {
    id: showDescriptionCard

    favButtonText: showDetailsTemplateContainer.favButtonText
    favButtonBgColor: showDetailsTemplateContainer.favButtonBg
    castModelData: showDetailsTemplateContainer.castData
    isCastLoaded: showDetails.isFetchFinished //to prevent load issues
  }
}
