import QtQuick
import QtQuick.Controls

Button {
  id: saveButton
  width: 100
  anchors {
    bottom: parent.bottom
    bottomMargin: 20
    horizontalCenter: parent.horizontalCenter
  }

  text: "Salvar"
  onClicked: () => {
               if (editUserNameInput.text === "") {
                 errorMessage.visible = true
                 errorMessage.text = "O username não pode ser vazio"
                 return
               }
               settingsConfig.userName = editUserNameInput.text
               errorMessage.visible = true
               errorMessage.text = "Alterações salvas com sucesso!"
               redirectTimer.start()
             }

  Timer {
    id: redirectTimer
    interval: 2300
    repeat: false
    onTriggered: {
      errorMessage.visible = false
      errorMessage.text = ""
      stackView.pop(null)
    }
  }

  background: Rectangle {
    id: saveButtonColor
    color: "white"
    border.color: saveButton.hovered ? "#27AE60" : "silver"
    radius: 5

    Behavior on color {
      PropertyAnimation {
        duration: 200
        easing.type: Easing.InOutQuad
      }
    }
    Behavior on border.color {
      PropertyAnimation {
        duration: 200
        easing.type: Easing.InOutQuad
      }
    }
  }
}
