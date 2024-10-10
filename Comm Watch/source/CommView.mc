//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Communications;
using Toybox.System;

class CommView extends WatchUi.View {
    var screenShape;

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        screenShape = System.getDeviceSettings().screenShape;
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function drawIntroPage(dc) {
        if(System.SCREEN_SHAPE_ROUND != screenShape) {
            dc.drawText(dc.getWidth() / 2, 25,  Graphics.FONT_SMALL, "Communications", Graphics.TEXT_JUSTIFY_CENTER);
            dc.drawText(dc.getWidth() / 2, 55, Graphics.FONT_SMALL, "Test", Graphics.TEXT_JUSTIFY_CENTER);
            dc.drawText(dc.getWidth() / 2, 80,  Graphics.FONT_TINY,  "Connect a phone then", Graphics.TEXT_JUSTIFY_CENTER);
            dc.drawText(dc.getWidth() / 2, 100,  Graphics.FONT_TINY,  "use the menu to send", Graphics.TEXT_JUSTIFY_CENTER);
            dc.drawText(dc.getWidth() / 2, 120,  Graphics.FONT_TINY,  "strings to your phone", Graphics.TEXT_JUSTIFY_CENTER);
        } 
    }

    function onUpdate(dc) {
       View.onUpdate(dc);
    }


}