import QtQuick 2.6
import QtQuick.Window 2.2

import "web3.min.js" as Web3

Window {
    id: main

    property var api

    visible: true

    Component.onCompleted: {
        Web3 = Web3.require('web3');

        api = new Web3();
        api.setProvider(new api.providers.HttpProvider("http://127.0.0.1:8545"));

        console.log("Coinbase: " + api.eth.coinbase);
        console.log("Balance: " + api.eth.getBalance(api.eth.coinbase));
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
}
