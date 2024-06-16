import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Dialogs

Rectangle {
  id: settingsCard
  width: root.width
  height: root.height
  color: "transparent"

  FileDialog {
    id: fileDialog
    nameFilters: ["Image Files (*.jpg *.png *.jpeg)"]
    onAccepted: settingsConfig.userAvatar = selectedFile
    onRejected: {
      errorMessage.text = "Ocorreu um erro, tente novamente"
      errorMessage.visible = true
    }
  }

  Text {
    anchors {
      bottom: settingsInfo.top
      bottomMargin: 16
      horizontalCenter: parent.horizontalCenter
    }
    text: "• Suas Informações •"
    font.family: bodyFont.font.family
    font.pixelSize: 44
  }

  Rectangle {
    id: settingsInfo
    anchors.centerIn: parent
    width: 500
    height: 500

    color: 'lightgray'
    radius: 20
    border {
      color: "#27AE60"
    }

    MultiEffect {
      //to cut the userAvatar
      id: userAvatarMask
      source: userAvatar
      anchors.fill: userAvatar
      maskEnabled: true
      maskSource: mask
    }

    Image {
      id: userAvatar
      source: settingsConfig.userAvatar
      anchors {
        top: parent.top
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
      }
      width: 200
      height: 200
      visible: false

      //transition when change avatar
      Behavior on source {
        SequentialAnimation {
          PropertyAnimation {
            target: userAvatarMask
            property: "opacity"
            from: 1
            to: 0
            duration: 500
          }
          PropertyAnimation {
            target: userAvatar
            property: "source"
            duration: 0
          }
          PropertyAnimation {
            target: userAvatarMask
            property: "opacity"
            from: 0
            to: 1
            duration: 500
          }
        }
      }
    }

    Item {
      id: mask
      width: userAvatar.width
      height: userAvatar.height
      layer.enabled: true
      visible: false

      Rectangle {
        width: userAvatar.width
        height: userAvatar.height
        radius: width / 2
        color: "black"
      }
    }

    Text {
      id: userName
      anchors {
        top: userAvatar.bottom
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
      }

      text: settingsConfig.userName
      font.family: bodyFont.font.family
      font.pixelSize: 30

      // transition when change username
      Behavior on text {
        SequentialAnimation {
          PropertyAnimation {
            target: userName
            property: "opacity"
            from: 1
            to: 0
            duration: 500
          }
          PropertyAnimation {
            target: userName
            property: "text"
            duration: 0
          }
          PropertyAnimation {
            target: userName
            property: "opacity"
            from: 0
            to: 1
            duration: 500
          }
        }
      }
    }

    Button {
      id: openImageLoader
      width: 140
      anchors {
        top: userName.bottom
        topMargin: 20
        horizontalCenter: parent.horizontalCenter
      }

      text: "Carregar avatar"
      onClicked: () => {
                   fileDialog.open()
                 }

      background: Rectangle {
        id: openImageLoaderColor
        color: "white"
        border.color: openImageLoader.hovered ? "#27AE60" : "white"
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

    Label {
      anchors {
        bottom: editUserNameInput.top
        bottomMargin: 2
        left: editUserNameInput.left
      }
      text: "Edite o username"
      font.pixelSize: 12
    }

    TextField {
      id: editUserNameInput
      width: 160
      height: 40

      anchors {
        top: openImageLoader.bottom
        topMargin: 60
        horizontalCenter: parent.horizontalCenter
      }

      placeholderText: "Edite seu username"
      text: settingsConfig.userName
      focus: true

      onTextChanged: {
        if (editUserNameInput.text.length > 15) {
          errorMessage.visible = true
          errorMessage = "O username não pode ter mais de 15 caracteres."
          saveButton.enabled = false
        }

        errorMessage.visible = false
        saveButton.enabled = true
      }
    }

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
                 }

      background: Rectangle {
        id: saveButtonColor
        color: "white"
        border.color: saveButton.hovered ? "#27AE60" : "white"
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

    Text {
      id: errorMessage
      anchors {
        top: settingsInfo.bottom
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
      }
      text: "O username não pode ter mais de 15 caracteres."
      color: "red"
      visible: false
    }
  }
}
