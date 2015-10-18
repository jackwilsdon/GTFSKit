//
//  CSVRowObject.swift
//  CSVKit
//
//  Created by Jack Wilsdon on 18/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public class CSVRowObject: CSVRow {
    public required init(_ row: CSVRow) {
        if row.valid {
            super.init(row.row!)
        } else {
            super.init()
        }
    }
}
