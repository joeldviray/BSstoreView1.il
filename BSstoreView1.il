 procedure(BSstoreView1()
    wid1=geGetWindowBox(hiGetCurrentWindow())
    sprintf(message "View 1 stored\n")
    when(message
                        win=geGetEditCellViewWindow(geGetEditCellView())
                        point=hiGetPoint(win)
                        geDeleteAllHilightSet(geGetWindowCellView())
                        ;Set label size depending on window zoom
                                x2 = xCoord(cadr(geGetWindowBox(hiGetCurrentWindow())))
                                x1 = xCoord(car(geGetWindowBox(hiGetCurrentWindow())))
                                dx = x2 - x1
                                labelheight = dx/100
                        when(point
                                hs=geCreateHilightSet(geGetWindowCellView()
                                        abDynamicDisplay.lpp || '("y4" "drawing"))
                                geAddHilightLabel(
                                        hs
                                        point
                                        message
                                        abDynamicDisplay.justify || "centerCenter"
                                        abDynamicDisplay.orient || "R0"
                                        abDynamicDisplay.font || "roman"
                                        abDynamicDisplay.height || labelheight
                                        nil
                                )
                                hs->enable=t
                                geRefresh()
                                hiRegTimer("geDeleteAllHilightSet(geGetWindowCellView()) geRefresh()" 25)
                        )
                )
        message = nil
);procedure
hiSetBindKey("Layout" "Ctrl Shift<key>KP_Home" "BSstoreView1()")


procedure(BSreselectView1()
    win=geGetEditCellViewWindow(geGetEditCellView())
    hiZoomIn(win wid1) 
    sprintf(message "View 1 selected\n")
    when(message

                        win=geGetEditCellViewWindow(geGetEditCellView())
                        point=hiGetPoint(win)
                        geDeleteAllHilightSet(geGetWindowCellView())
                        ;Set label size depending on window zoom
                                x2 = xCoord(cadr(geGetWindowBox(hiGetCurrentWindow())))
                                x1 = xCoord(car(geGetWindowBox(hiGetCurrentWindow())))
                                dx = x2 - x1
                                labelheight = dx/100
                        when(point
                                hs=geCreateHilightSet(geGetWindowCellView()
                                        abDynamicDisplay.lpp || '("y4" "drawing"))
                                geAddHilightLabel(
                                        hs
                                        point
                                        message

                                        abDynamicDisplay.justify || "centerCenter"
                                        abDynamicDisplay.orient || "R0"
                                        abDynamicDisplay.font || "roman"
                                        abDynamicDisplay.height || labelheight
                                        nil
                                )
                                hs->enable=t
                                geRefresh()
                                hiRegTimer("geDeleteAllHilightSet(geGetWindowCellView()) geRefresh()" 25)
                        )
                )
    message = nil
);procedure
hiSetBindKey("Layout" "Ctrl<key>KP_Home" "BSreselectView1()")
