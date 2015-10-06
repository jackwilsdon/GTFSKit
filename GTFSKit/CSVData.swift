//
//  CSVData.swift
//  GTFSKit
//
//  Created by Jack Wilsdon on 06/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public class CSVData {
    private let data: [String: String]

    public init(data: [String: String]) {
        self.data = data
    }

    public func containsColumn(columnName: String) -> Bool {
        if let _ = data[columnName] {
            return true
        }

        return false
    }

    public func containsColumns(columnNames: String...) -> Bool {
        for columnName in columnNames {
            if !containsColumn(columnName) {
                print("Missing \(columnName)")
                return false
            }
        }

        return true
    }

    public subscript(columnName: String) -> String? {
        get {
            return data[columnName]
        }
    }
}
