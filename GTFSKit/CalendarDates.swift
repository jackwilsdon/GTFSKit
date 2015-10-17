//
//  CalendarDates.swift
//  GTFSKit
//
//  Created by Rocky Breslow on 10/16/15.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public struct CalendarDates: CSVParsable {
    public let serviceId: String                    // service_id                (Required)
    public let date: NSDate                         // date                      (Required)
    public let exceptionType: ExceptionType         // exception_type            (Required)
    
    public init(serviceId: String, date: NSDate, exceptionType: ExceptionType) {
        self.serviceId = serviceId
        self.date = date
        self.exceptionType = exceptionType
    }
    
    public static func parse(data: CSVData) -> CalendarDates? {
        if !data.containsColumns("service_id", "date", "exception_type") {
            return nil
        }
        
        let serviceId = data["service_id"]!
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        let date = formatter.dateFromString(data["date"]!)!
        
        let exceptionType = data.get("exception_type", parser: ExceptionType.fromString)!
        
        return CalendarDates(serviceId: serviceId, date: date, exceptionType: exceptionType)
    }
    
}
