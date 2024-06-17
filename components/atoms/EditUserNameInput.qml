import QtQuick
import QtQuick.Controls

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
