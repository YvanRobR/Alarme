import QtQuick 2.15

Item {
    implicitHeight: 70
    width: parent ? parent.width : 500

    Text {
        anchors.centerIn: parent
        text: "Alarme"
        color: "white"
        font.pixelSize: 30
        font.bold: true
    }
}