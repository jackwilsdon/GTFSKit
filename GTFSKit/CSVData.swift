//
//  CSVData.swift
//  GTFSKit
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

    public func get<T>(columnName: String, parser: (String -> T?)) -> T? {
        if let value = self[columnName] {
            return parser(value);
        } else {
            return nil;
        }
    }

    public subscript(columnName: String) -> String? {
        get {
            return data[columnName]
        }
    }
}
