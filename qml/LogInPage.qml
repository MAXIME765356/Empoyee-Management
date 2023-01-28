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


    Rectangle {
            id: iconRect
            width: parent.width
            height: parent.height / 3
            color: backGroundColor

            Text {
                id: icontext
                text: qsTr("\uf169")
                anchors.centerIn: parent
                font.pointSize: 112
                font.family: "fontawesome"
                color: mainAppColor
            }
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

        

        

        Item {
            height: 20
        }

        CButton{
            Layout.preferredHeight:  80
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: " Add Employee"
            baseColor: "brown"
            borderColor: mainAppColor
            Image {
                 source: ("qrc:/Images/user_add.png")
                 x:25
                 y:20
                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }

            onClicked: {
                onClicked: stackView.push("qrc:/qml/RegisterScreen.qml")
            }


        }

         CButton{
            Layout.preferredHeight:  80
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Employee List"

            baseColor: "brown"
            borderColor: mainAppColor

            Image {
                 source: ("qrc:/Images/users.png")
                 x:25
                 y:20
                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: stackView.push("qrc:/qml/Employee.qml") //registerClicked()
        }


         CButton{
            Layout.preferredHeight:  80
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Update Employee"
            baseColor: "brown"
            borderColor: mainAppColor
            Image {
                 source: ("qrc:/Images/edit.png")
                 x:25
                 y:20
                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: stackView.push("qrc:/qml/Update.qml") //registerClicked()
        }


        CButton{
            Layout.preferredHeight:  80
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Delete Employee"
            baseColor: "brown"
            borderColor: mainAppColor
            Image {
                 source: ("qrc:/Images/remove.png")
                 x:25
                 y:20
                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: stackView.push("qrc:/qml/Delete.qml") //registerClicked()
        }



        
    }
}
