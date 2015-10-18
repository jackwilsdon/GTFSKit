//
//  CalendarDate.swift
//  GTFSKit
//

import Foundation

public struct CalendarDate: CSVParsable {
    public let serviceId: String                    // service_id                (Required)
    public let date: NSDate                         // date                      (Required)
    public let exceptionType: ExceptionType         // exception_type            (Required)

    public init(serviceId: String, date: NSDate, exceptionType: ExceptionType) {
        self.serviceId = serviceId
        self.date = date
        self.exceptionType = exceptionType
    }

    public static func parse(data: CSVData) -> CalendarDate? {
        if !data.containsColumns("service_id", "date", "exception_type") {
            return nil
        }

        let serviceId = data["service_id"]!

        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyyMMdd"

        let date = formatter.dateFromString(data["date"]!)!

        let exceptionType = data.get("exception_type", parser: ExceptionType.fromString)!

        return CalendarDate(serviceId: serviceId, date: date, exceptionType: exceptionType)
    }

}
