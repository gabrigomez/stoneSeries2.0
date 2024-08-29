import QtQuick

import "../molecules" as Molecules

Item {
  anchors.centerIn: parent

  Molecules.NotFoundMolecule {
    anchors.centerIn: parent
    message: "Nenhum resultado encontrado."
    image: "../../assets/NotFound.png"
  }
}
