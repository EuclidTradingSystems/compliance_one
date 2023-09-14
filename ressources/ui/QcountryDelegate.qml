import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

ItemDelegate {
    id: root
    width: window.width
    leftInset: 6
    rightInset: 6
    topInset: 3
    bottomInset: 3

    required property var model

    contentItem: GridLayout {
        columns: portrait ? 2 : 4

        LabeledTextField {
            name: qsTr("County name")
            textOf: root.model.country_name
            onEdit: (txt) => { root.model.country_name = txt }
            placeHolder: qsTr("* Mandatory")
            Layout.columnSpan: 2
            readOnly: root.model.now_loading
        }

        LabeledTextField {
            name: qsTr("Official state name")
            textOf: root.model.official_state_name
            onEdit: (txt) => { root.model.official_state_name = txt }
            placeHolder: qsTr("* Mandatory")
            Layout.columnSpan: 2
            readOnly: root.model.now_loading
        }

        EnumValueChooser {
            name: qsTr("Sovereignty")
            model: sovereigntyListView.model
            enumOf: root.model.sovereignty_id
            onEdit: (value) => { root.model.sovereignty_id = value }
            Layout.columnSpan: 4
            Layout.fillWidth: true
            textRole: "name"
            valueRole: "id"
        }

        RoundButton {
            icon.source: "qrc:/icons/floppy-disk.svg"
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Save")
            onClicked: country.save(root.model.index)
            highlighted: true
            enabled: root.model.flagged_for_update
            visible: !root.model.now_loading
        }

        Item {
            Layout.fillWidth: true
            visible: !portrait && !root.model.now_loading
            Layout.columnSpan: portrait ? 1 : 2
        }

        BusyIndicator {
            visible: root.model.now_loading
            Layout.fillWidth: true
            Layout.columnSpan: portrait ? 2 : 4
        }

        RoundButton {
            icon.source: "qrc:/icons/trash-alt.svg"
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Delete")
            Layout.alignment: Qt.AlignRight
            visible: !root.model.now_loading
            onClicked: onExceptionAction(ToolTip.text,
                                         qsTr("The selected country will be deleted"),
                                         () => { country.remove(root.model.index) }, true)
        }
    }

    background: Rectangle {
        implicitHeight: Material.delegateHeight - 4
        radius: 4
        color: Material.background
        opacity: .8
    }
}
