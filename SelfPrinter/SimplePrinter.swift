#!/usr/bin/swift
//
//  SelfPrinter.swift
//  SelfPrinter
//
//  Created by Lin Cheng Lung on 2018/6/25.
//  Copyright © 2018 Lin Cheng Lung. All rights reserved.
//
import Foundation

let filePosition = CommandLine.arguments[0]

let fileContent = try! String(contentsOfFile: filePosition)

for char in Array(fileContent) {
    print(char, terminator: "")
    fflush(__stdoutp)

    if char == " " {
        usleep(arc4random_uniform(300000) + 100000)
    } else {
        usleep(arc4random_uniform(150000) + 50000)
    }
}
