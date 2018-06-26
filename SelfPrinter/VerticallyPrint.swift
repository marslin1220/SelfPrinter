#!/usr/bin/swift
//
//  main.swift
//  SelfPrinter
//
//  Created by Lin Cheng Lung on 2018/6/25.
//  Copyright © 2018 Lin Cheng Lung. All rights reserved.
//

import Foundation

print("\u{001B}[2J")
print("\u{001B}[2;0H", terminator: "")

let filePosition = CommandLine.arguments[0]
let fileContent = try! String(contentsOfFile: filePosition)
let newLines = fileContent.components(separatedBy: .newlines)
var printColumn: Int = 0
var loop = true

while loop {
    loop = false

    print("\u{001B}[2;\(printColumn + 1)H", terminator: "")
    fflush(__stdoutp)

    for (row, line) in newLines.enumerated() {
        if !loop && line.count >= printColumn {
            loop = true
        }

        if line.count > printColumn && Array(line)[printColumn] != " " {
            usleep(100000)
            print(Array(line)[printColumn], terminator: "")
        }

        print("\u{001B}[\(row + 2);\(printColumn + 1)H", terminator: "")
        fflush(__stdoutp)
    }

    printColumn = printColumn + 1
}
