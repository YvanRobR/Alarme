import QtQuick
import QtQuick.Shapes

Item {

    id: root

    width: 320
    height: 320

    // 0.0 → vide
    // 1.0 → plein
    property real progress: 1.0

    property string timeText: "--:--"

    Shape {

        anchors.fill: parent

        ShapePath {

            strokeWidth: 16
            strokeColor: "#32363d"
            fillColor: "transparent"

            PathAngleArc {
                centerX: root.width/2
                centerY: root.height/2

                radiusX: 135
                radiusY: 135

                startAngle: 0
                sweepAngle: 360
            }
        }

        ShapePath {

            strokeWidth: 16
            strokeColor: "#4EA3FF"
            fillColor: "transparent"

            capStyle: ShapePath.RoundCap

            PathAngleArc {

                centerX: root.width/2
                centerY: root.height/2

                radiusX: 135
                radiusY: 135

                startAngle: -90

                sweepAngle: progress * 360

            }

        }

    }

    Text {

        anchors.centerIn: parent

        text: timeText

        color: "white"

        font.pixelSize: 42

        font.bold: true

    }

    Behavior on progress {

        NumberAnimation {

            duration: 250

            easing.type: Easing.InOutQuad

        }

    }

}