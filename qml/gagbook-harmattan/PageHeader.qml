/*
    Copyright (C) 2012  Dickson Leong
    This file is part of GagBook.

    GagBook is free software: you can redistribute it and/or modify it
    under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
    License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this program. If not, see http://www.gnu.org/licenses/.
*/

import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1

Item{
    id: root

    property string text
    property bool busy: false
    property bool comboboxVisible: false
    signal clicked

    height: constant.headerHeight
    width: parent.width

    Image{
        id: background
        anchors.fill: parent
        source: headerPress.pressed ? "Images/color10-meegotouch-view-header-fixed-pressed.png"
                                    : "Images/color10-meegotouch-view-header-fixed.png"
        sourceSize.width: parent.width
        sourceSize.height: parent.height
    }

    Text{
        id: mainText
        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: busyLoader.left
            margins: constant.paddingXLarge
        }
        font.pixelSize: constant.fontSizeXLarge
        color: "white"
        elide: Text.ElideRight
        text: root.text
    }

    Loader{
        id: busyLoader
        anchors{
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: constant.paddingXLarge
        }
        sourceComponent: busy ? updatingIndicator : (comboboxVisible ? combobox : undefined )
    }

    Component{
        id: updatingIndicator

        BusyIndicator{
            platformStyle: BusyIndicatorStyle{ inverted: true }
            running: true
        }
    }

    Component{
        id: combobox

        Image{
            source: "Images/meegotouch-combobox-indicator-inverted.png"
        }
    }

    MouseArea{
        id: headerPress
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
