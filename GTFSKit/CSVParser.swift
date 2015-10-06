//
//  CSVParser.swift
//  GTFSKit
//
//  Created by Jack Wilsdon on 05/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public protocol CSVParsable {
    static func parse(data: CSVData) -> Self?
}

public class CSVParser {
    private let lines: [String]
    public init(lines: [String]) {
        self.lines = lines
    }

    private func stripWhitespace(value: String) -> String {
        return value.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }

    private func getRowValues(line: String) -> [String] {
        return line.characters.split(",").map(String.init).map(stripWhitespace)
    }

    public func parse<T: CSVParsable>(parsable: T.Type) -> [T]? {
        var instances = [T]()
        var headings = [String]()

        for (lineIndex, line) in lines.enumerate() {
            let values = getRowValues(line)

            if lineIndex == 0 {
                headings = values
                continue
            }

            let minLength = min(headings.count, values.count)
            var lineData = [String: String]()

            for valueIndex in 0..<minLength {
                lineData[headings[valueIndex]] = values[valueIndex]
            }

            if let instance = parsable.parse(CSVData(data: lineData)) {
                instances.append(instance)
            } else {
                return nil
            }
        }

        return instances
    }
}
