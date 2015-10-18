//
//  CSVValue.swift
//  CSVKit
//
//  Created by Jack Wilsdon on 18/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public class CSVValue {
    private let rawValue: String?

    public var asString: String? { return valid ? rawValue : nil }
    public var asInt: Int? { return valid ? Int(rawValue!) : nil }
    public var asBool: Bool? { return valid ? asInt == 1 : nil }

    public let valid: Bool

    public func asEnum<T: RawRepresentable where T.RawValue == Int>() -> T? {
        if let intValue = asInt {
            return T(rawValue: intValue)
        }

        return nil
    }

    public init(_ csvValue: String) {
        rawValue = csvValue
        valid = true
    }

    public init() {
        rawValue = nil
        valid = false
    }
}