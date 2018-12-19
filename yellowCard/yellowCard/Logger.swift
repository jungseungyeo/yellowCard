//
//  log.swift
//  yellowCard
//
//  Created by 여정승 on 16/12/2018.
//  Copyright © 2018 linsaeng. All rights reserved.
//

import SwiftyBeaver

let log = SwiftyBeaver.self

class Logger {

    static func setup() {

        let console = ConsoleDestination()  // log to Xcode Console

        // setup color
        console.levelString.verbose = "💜 VERBOSE"
        console.levelString.debug   = "💚 DEBUG  "
        console.levelString.info    = "💙 INFO   "
        console.levelString.warning = "💛 WARNING"
        console.levelString.error   = "❤️ ERROR  "

        console.format = "$DHH:mm:ss.SSS$d [$L] $N.$F:$l - $M" // "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"

        log.addDestination(console)
    }
}



