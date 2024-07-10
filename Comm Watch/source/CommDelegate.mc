//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi;
using Toybox.System;
using Toybox.Communications;

class CommListener extends Communications.ConnectionListener {
    function initialize() {
        Communications.ConnectionListener.initialize();
    }

    function onComplete() {
        System.println("Transmit Complete");
    }

    function onError() {
        System.println("Transmit Failed");
    }
}

class CommInputDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        WatchUi.BehaviorDelegate.initialize();
    }

    function onMenu() {
        var menu = new WatchUi.Menu();
        var delegate;

        menu.addItem("Prev", :prev);
        menu.addItem("Next", :next);
        menu.addItem("Pause", :pause);
        menu.addItem("Play", :play);
        delegate = new SendMenuDelegate();
        WatchUi.pushView(menu, delegate, SLIDE_IMMEDIATE);

        return true;
    }

    function onTap(event) {
        if(page == 0) {
            page = 1;
        } else {
            page = 0;
        }
        WatchUi.requestUpdate();
        return true;
    }
}


class SendMenuDelegate extends WatchUi.MenuInputDelegate {
    function initialize() {
        WatchUi.MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        var listener = new CommListener();

        if(item == :next) {
            Communications.transmit("Next", null, listener);
        } else if(item == :prev) {
            Communications.transmit("Prev", null, listener);
        }else if(item == :pause) {
            Communications.transmit("Pause", null, listener);
        } 
        else if(item == :play) {
            Communications.transmit("Play", null, listener);
        } 
         else if(item == :garmin) {
            Communications.transmit("ConnectIQ", null, listener);
        }

        WatchUi.requestUpdate();
    }
}
