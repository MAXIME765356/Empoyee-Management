import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

import "qrc:/js/backend.js" as Backend

Page {
    id: loginPage

    signal registerClicked()

    background: Rectangle {
        color: backGroundColor
    }



    header: ToolBar {
      background:
          Rectangle {
          implicitHeight: 50
          implicitWidth: 200
          color: "transparent"
      }

      RowLayout {
          anchors.fill: parent
          ToolButton {
              id: control
              font.family: "fontawesome"
              text: qsTr("\uf060")
              font.pointSize: 24
              rightPadding: 10
              contentItem: Text {
                  text: control.text
                  font: control.font
                  opacity: enabled ? 1.0 : 0.3
                  color: mainTextCOlor
                  horizontalAlignment: Text.AlignHCenter
                  verticalAlignment: Text.AlignVCenter
                  elide: Text.ElideRight
              }
              onClicked: logoutSession()
          }
          Item { Layout.fillWidth: true }
      }
  }





    ColumnLayout {
        width: parent.width
        anchors.top: iconRect.bottom
        spacing: 15

        Image {
                id: welcome
                source: "qrc:/Images/cpp.png"
                x: 90
                y: 150
                width: 150
                height: 400

            }


        Image {
                id: q
                source: "qrc:/Images/qt.png"
                x: 150
                y: 150
                width: 150
                height: 400

            }

    Text {
            id: welcometext
            text:                     "  A mobile
                   and desktop app built for android
                   operating systems it is user friendly
                   and offers crud services,calculates
                   salary and stores data in sqlite database,\n"
            anchors.centerIn: parent
            font.pointSize: 22
            color: mainTextCOlor
        }



    Image {
            id: w
            source: "qrc:/Images/sqlite.jpg"
            x: 90
            y: 150
            width: 150
            height: 300

        }
        }




    }

