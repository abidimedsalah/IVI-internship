import QtQuick 2.0
import Qt.labs.folderlistmodel 1.0

FolderListModel{
    property string mod:"file:///home/"
    id:usb
    folder:mod
    nameFilters: ["*.mp3"]
}

