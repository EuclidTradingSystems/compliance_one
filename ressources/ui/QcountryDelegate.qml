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
            name: qsTr("Name")
            textOf: root.model.name
            onEdit: (txt) => { root.model.name = txt }
            placeHolder: qsTr("* Mandatory")
            readOnly: root.model.now_loading
        }

        LabeledTextField {
            name: qsTr("Flag")
            textOf: root.model.emoji
            onEdit: (txt) => { root.model.emoji = txt }
            readOnly: root.model.now_loading
        }

        // LabeledTextField {
        //     name: qsTr("Official state name")
        //     textOf: root.model.official_state_name
        //     onEdit: (txt) => { root.model.official_state_name = txt }
        //     placeHolder: qsTr("* Mandatory")
        //     Layout.columnSpan: 2
        //     readOnly: root.model.now_loading
        // }

        LabeledTextField {
            name: qsTr("ISO 3")
            textOf: root.model.iso3
            onEdit: (txt) => { root.model.iso3 = txt }
            placeHolder: qsTr("* Mandatory")
            readOnly: root.model.now_loading
        }

        LabeledTextField {
            name: qsTr("Numeric code")
            textOf: root.model.numeric_code
            onEdit: (txt) => { root.model.numeric_code = txt }
            placeHolder: qsTr("* Mandatory")
            readOnly: root.model.now_loading
        }

        EnumValueChooser {
            id: sovereigntyCombo
            name: qsTr("Sovereignty")
            model: countryListView.model
            enumOf: root.model.sovereignty_id
            onEdit: (value) => { root.model.sovereignty_id = value }
            Layout.fillWidth: true
            valueRole: "id"
            textRole: "name"
        }

        LabeledTextField {
            name: qsTr("Calling code")
            textOf: root.model.phonecode
            onEdit: (txt) => { root.model.phonecode = txt }
            placeHolder: qsTr("* Mandatory")
            readOnly: root.model.now_loading
        }

        IntChooser {
            name: qsTr("Latitude")
            numberOf: root.model.latitude
            onEdit: (val) => { root.model.latitude = val }
            minimum: -90.0
            maximum: 90.0
            editable: !root.model.now_loading
        }

        IntChooser {
            name: qsTr("Longitude")
            numberOf: root.model.longitude
            onEdit: (val) => { root.model.longitude = val }
            minimum: -180.0
            maximum: 180.0
            editable: !root.model.now_loading
        }

        LabeledTextField {
            name: qsTr("Created at")
            textOf: root.model.created_at
            onEdit: (txt) => { root.model.created_at = txt }
            readOnly: root.model.now_loading
        }

        LabeledTextField {
            name: qsTr("Updated at")
            textOf: root.model.updated_at
            onEdit: (txt) => { root.model.updated_at = txt }
            readOnly: root.model.now_loading
        }

        LabeledTextField {
            name: qsTr("WikiData")
            textOf: root.model.wikiDataId
            onEdit: (txt) => { root.model.wikiDataId = txt }
            readOnly: root.model.now_loading
        }

        Item {}

        EnumIntChooser {
            name: qsTr("Internal Ranking")
            model: rateModel
            enumOf: root.model.ranking
            onEdit: (index) => { root.model.ranking = index }
        }

        EnumIntChooser {
            name: qsTr("FATF")
            model: rateModel
            enumOf: root.model.fatf
            onEdit: (index) => { root.model.fatf = index }
        }

        IntChooser {
            name: qsTr("Transparency International")
            minimum: 1
            maximum: 10
            numberOf: root.model.transparency
            onEdit: (val) => { root.model.transparency = val }
            editable: !root.model.now_loading
        }

        IntChooser {
            name: qsTr("World Bank")
            minimum: 1
            maximum: 10
            numberOf: root.model.world_bank
            onEdit: (val) => { root.model.world_bank = val }
            editable: !root.model.now_loading
        }

        RoundButton {
            icon.source: "qrc:/icons/floppy-disk.svg"
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Save")
            onClicked: country_list.save(root.model.index)
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
                                         () => { country_list.remove(root.model.index) }, true)
        }
    }

    background: Rectangle {
        implicitHeight: Material.delegateHeight - 4
        radius: 4
        color: Material.background
        opacity: .8
    }
}
