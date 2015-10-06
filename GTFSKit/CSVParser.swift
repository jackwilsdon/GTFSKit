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
    private var alreadyParsed: Bool = false
    private var data: [CSVData] = [CSVData]()
    
    public init(lines: [String]) {
        self.lines = lines
    }
    
    private func getRowValues(line: String) -> [String] {
        return line.characters.split(",").map({ String($0) })
    }
    
    private func getParsedData(lines: [String]) -> [CSVData] {
        var parsedData = [CSVData]()
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
            
            parsedData.append(CSVData(data: lineData))
        }
        
        return parsedData
    }
    
    public func parse<T: CSVParsable>(parsable: T.Type) -> [T]? {
        if !alreadyParsed {
            data = getParsedData(lines)
            alreadyParsed = true
        }
        
        var parsedInstances = [T]()
        
        for row in data {
            guard let parsedInstance = parsable.parse(row) else {
                return nil
            }
            
            parsedInstances.append(parsedInstance)
        }
        
        return parsedInstances
    }
}