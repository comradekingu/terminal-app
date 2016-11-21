/*
 * Copyright (C) 2013, 2014 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authored by: Filippo Scognamiglio <flscogna@gmail.com>
 */

import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
    objectName: "layoutsPage"

    header: PageHeader {
        title: i18n.tr("Layouts")
        flickable: listView
    }

    onVisibleChanged: {
        if (visible === false)
            settings.profilesChanged();
    }

    ScrollView {
        anchors.fill: parent
        ListView {
            id: listView
            anchors.fill: parent
            model: settings.profilesList
            delegate: ListItem {
                ListItemLayout {
                    anchors.fill: parent
                    title.text: name

                    Switch {
                        id: layoutSwitch
                        SlotsLayout.position: SlotsLayout.Trailing

                        checked: profileVisible
                        onCheckedChanged: {
                            settings.profilesList.setProperty(index, "profileVisible", checked);
                        }
                    }
                }

                onClicked: layoutSwitch.trigger()
            }
        }
    }
}
