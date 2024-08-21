import QtQuick

import "../molecules" as Molecules

Item {
  anchors.centerIn: parent

  Molecules.NotFoundMolecule {
    message: "Nenhum resultado encontrado."
    image: "../../assets/NotFound.png"

    anchors.centerIn: parent
  }
}
