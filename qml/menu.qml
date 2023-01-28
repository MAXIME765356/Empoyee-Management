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







    ColumnLayout {
        width: parent.width
        anchors.top: iconRect.bottom
        spacing: 15





        Image {
          id: welcome
                  source: "qrc:/Images/Corporate Management.png"
                  Layout.preferredHeight:  300
                   Layout.preferredWidth: -300




      }





        Item {
            height: 20
        }



        CButton{
            Layout.preferredHeight:  80
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: " Permanent Employee"
            baseColor: "blue"
            borderColor: mainAppColor
            Image {
                 source: ("qrc:/Images/user_ok.png")
                 x:25
                 y:20
                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: {
                onClicked: stackView.push("qrc:/qml/LogInPage.qml")
            }


        }

         CButton{
            Layout.preferredHeight:  80
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Contract Employee"
            baseColor: "blue"
            borderColor: mainAppColor
            Image {
                 source: ("qrc:/Images/user_menu.png")
                 x:25
                 y:20
                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: stackView.push("qrc:/qml/contract.qml") //registerClicked()
        }


         CButton{
            Layout.preferredHeight:  80
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Sales Employee"
            baseColor: "blue"
            borderColor: mainAppColor
            Image {
                 source: ("qrc:/Images/trolley.png")
                 x:25
                 y:20
                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: stackView.push("qrc:/qml/salesman.qml") //registerClicked()
        }


        CButton{
            Layout.preferredHeight:  80
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Employee Attendance"
            baseColor: "blue"
            borderColor: mainAppColor
            Image {
                 source: ("qrc:/Images/user_edit.png")
                 x:25
                 y:20
                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: stackView.push("qrc:/qml/attendance.qml") //registerClicked()
        }


        CButton{
            Layout.preferredHeight:  80
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Quit"
            baseColor: "blue"
            borderColor: mainAppColor
            Image {
                 source: ("qrc:/Images/exit.png")
                 x:25
                 y:20
                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: stackView.push(Qt.quit()) //registerClicked()
        }


        Text {
                   id: name
                   text: '<html><style type="text/css"></style><a href="http://google.com">About App?</a></html>' //qsTr("About App?")
                   linkColor: mainTextCOlor
                   Layout.alignment: Qt.AlignHCenter
                   font.pointSize: 14
                   color: mainTextCOlor
                   Layout.margins: 10
                   onLinkActivated: aboutApp()
               }




    }
}
