import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Layouts 1.1 //ColumnLayout
import QtQuick.Dialogs 1.2 //FileDialog
//import Qt.labs.settings 1.0
//import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2 //TextFieldStyle



Page {
    id: regPage



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
                onClicked: sales()
            }
            Item { Layout.fillWidth: true }
        }
    }







    Text {
        id: signupText
        text: qsTr("Salesman ")
        font.pointSize: 24
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        color: mainTextCOlor
    }

    ColumnLayout {
        width: parent.width
        anchors.top: signupText.bottom
        anchors.topMargin: 30
        spacing: 25



        TextField {
            id: registerName
            placeholderText: qsTr("Name")
            Layout.preferredHeight:  110
            Layout.preferredWidth: parent.width - 20
            Layout.alignment: Qt.AlignHCenter
            color: mainTextCOlor
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 30
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"

                Text {
                    text: "\uf007"
                    font.pointSize: 14
                    font.family: "fontawesome"
                    color: mainAppColor
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 10
                }

                Rectangle {
                    width: parent.width - 10
                    height: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    color: mainAppColor
                }


            }


        }


       TextField {
            id: registerPhone
            placeholderText: qsTr("Phone No")
            Layout.preferredHeight: 110
            Layout.preferredWidth: parent.width - 20
            Layout.alignment: Qt.AlignHCenter
            color: mainTextCOlor
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 30
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"

                Text {
                    text: "\uf007"
                    font.pointSize: 14
                    font.family: "fontawesome"
                    color: mainAppColor
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 10
                }

                Rectangle {
                    width: parent.width - 10
                    height: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    color: mainAppColor
                }


            }


        }




       TextField {
            id: registerProduct
            placeholderText: qsTr("Products Sold")
            Layout.preferredHeight:  110
            Layout.preferredWidth: parent.width - 20
            Layout.alignment: Qt.AlignHCenter
            color: mainTextCOlor
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 30
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"

                Text {
                    text: "\uf007"
                    font.pointSize: 14
                    font.family: "fontawesome"
                    color: mainAppColor
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 10
                }

                Rectangle {
                    width: parent.width - 10
                    height: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    color: mainAppColor
                }


            }


        }







         TextField {
            id: registerWork
            placeholderText: qsTr("Working Hours")
            Layout.preferredHeight:  110
            Layout.preferredWidth: parent.width - 20
            Layout.alignment: Qt.AlignHCenter
            color: mainTextCOlor
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 30
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"

                Text {
                    text: "\uf007"
                    font.pointSize: 14
                    font.family: "fontawesome"
                    color: mainAppColor
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 10
                }

                Rectangle {
                    width: parent.width - 10
                    height: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    color: mainAppColor
                }


            }


        }











        Item {
            height: 20
        }


            Button {
                x: 138
                y: 450

                Layout.preferredWidth: 200
                height: 67
                Text {
                    anchors.centerIn: parent
                    text: qsTr("Submit")
                    Image {
                         source: ("qrc:/Images/ok.png")
                         x:60

                         Layout.preferredHeight:  300
                          Layout.preferredWidth: -350
                      }
                    font { family: mySettings.fontType; pointSize: 15; }
                }

                // Veritabanına yeni bir giriş yapın
                onClicked: {
                    dialogKayit.open()
                }

            }
            MessageDialog{
                id: dialogKayit
                title: qsTr("Record")
                text: qsTr("Complete the Registration Process?")
                icon: StandardIcon.Warning
                standardButtons: StandardButton.Yes | StandardButton.No
                onYes: {

                    //  Calcuation to decide wage where 22 = days, 10.3 = per hour income  //
                       //   1% bonus per Product, work hour per day * product sold percentage //
                    //entered data goes to ListModel respectively,
                     if(database.insert2( registerName.text, registerPhone.text, registerProduct.text,registerWork.text,( (((registerWork.text*10.3)*30)*registerProduct.text)/100  +((registerWork.text*10.3)*30))  ))
                    {
                        console.log("Record Successfully")

                        registerName.text = "";
                        registerPhone.text = "";
                        registerProduct.text = "";
                        registerWork.text = "";
                        maximeModel.updateModel() // And updates the data model with a new record


                    }
                    else{
                        console.log("Failed to add record!!!")
                    }
                }


                    }

    }



}
