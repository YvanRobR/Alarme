import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {

    id: window

    width: 520
    height: 720

    visible: true

    title: "Alarme"

    color: "#202124"

    ColumnLayout {

        anchors.fill: parent

        anchors.margins: 30

        spacing: 30

        Label {

            text: "ALARME"

            color: "white"

            font.pixelSize: 34

            font.bold: true

            horizontalAlignment: Text.AlignHCenter

            Layout.fillWidth: true
        }

        Label {

            id: currentTime

            color: "#58a6ff"

            font.pixelSize: 64

            horizontalAlignment: Text.AlignHCenter

            Layout.fillWidth: true
        }

        Rectangle {

            Layout.fillWidth: true

            Layout.preferredHeight: 320

            radius: 160

            color: "#2b2d31"

            border.width: 8

            border.color: "#4ea3ff"

            Label {

                anchors.centerIn: parent

                text: "07:30"

                color: "white"

                font.pixelSize: 46
            }
        }

        Button {

            text: "Démarrer"

            Layout.fillWidth: true

            height: 55
        }

        Button {

            text: "Choisir la sonnerie"

            Layout.fillWidth: true

            height: 55
        }

    }

    Timer {

        interval: 1000

        running: true

        repeat: true

        onTriggered: {

            currentTime.text =
                    Qt.formatTime(new Date(),"hh:mm:ss")

        }

    }

    Component.onCompleted: {

        currentTime.text =
                Qt.formatTime(new Date(),"hh:mm:ss")

    }

}