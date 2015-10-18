//
//  CSVColumn.swift
//  CSVKit
//
//  Created by Jack Wilsdon on 18/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public class CSVColumn {
    public let heading: String?
    public let values: [CSVValue]?

    public let valid: Bool

    public init(_ csvHeading: String, _ csvColumn: [CSVValue]) {
        heading = csvHeading
        values = csvColumn
        valid = true
    }

    public init() {
        heading = nil
        values = nil
        valid = false
    }

    public subscript(index: Int) -> CSVValue {
        if !valid || index >= values!.count {
            return CSVValue()
        }

        return values![index]
    }
}