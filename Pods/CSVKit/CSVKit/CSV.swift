//
//  CSV.swift
//  CSVKit
//
//  Created by Jack Wilsdon on 17/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public class CSV {
    private(set) public var headings = [String]()
    private var columns = [String: [String]]()
    public var count: Int { return 0 }

    public init?(_ lines: [String], separator: Character = ",") {
        for (index, line) in lines.enumerate() {
            let values = line.characters.split(separator).map(String.init)

            if index == 0 {
                headings.appendContentsOf(values)

                for value in values {
                    print(columns[value])
                    columns[value] = [String]()
                }
            } else {
                if values.count != headings.count {
                    return nil
                }

                for (heading, value) in zip(headings, values) {
                    if var column = columns[heading] {
                        column.append(value)
                    } else {
                        return nil
                    }
                }
            }
        }
    }

    public convenience init?(_ raw: String, lineSeparator: Character = "\n", separator: Character = ",") {
        self.init(raw.characters.split(lineSeparator).map(String.init), separator: separator)
    }

    public subscript(index: Int) -> CSVRow {
        var row = [String: CSVValue]()
        var valid = true

        for heading in headings {
            if let column = columns[heading] {
                if (column.count >= index) {
                    valid = false
                }

                row[heading] = CSVValue(column[index])
            } else {
                valid = false
            }
        }

        if !valid {
            return CSVRow()
        }

        return CSVRow(row)
    }

    public subscript(index: String) -> CSVColumn {
        if let column = columns[index] {
            return CSVColumn(index, column.map(CSVValue.init))
        } else {
            return CSVColumn()
        }
    }
}