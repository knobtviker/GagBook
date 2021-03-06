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

PageStackWindow {
    id: appWindow

    showStatusBar: inPortrait
    initialPage: MainPage{ id: mainPage }

    Constant{ id: constant }
    Settings{ id: settings }

    InfoBanner{
        id: infoBanner
        topMargin: showStatusBar ? 40 : 8

        function alert(text){
            infoBanner.text = text
            infoBanner.show()
        }
    }

    Component.onCompleted: theme.inverted = !settings.whiteTheme
}
