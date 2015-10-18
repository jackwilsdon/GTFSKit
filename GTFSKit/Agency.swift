//
//  Agency.swift
//  GTFSKit
//

import Foundation
import CSVKit

public class Agency : CSVRowObject {
    public var id: String? { return self["agency_id"].asString }                // agency_id        (Optional)
    public var name: String { return self["agency_name"].asString! }            // agency_name      (Required)
    public var url: String { return self["agency_url"].asString! }              // agency_url       (Required)
    public var timezone: String { return self["agency_timezone"].asString! }    // agency_timezone  (Required)
    public var lang: String? { return self["agency_lang"].asString }            // agency_lang      (Optional)
    public var phone: String? { return self["agency_phone"].asString }          // agency_phone     (Optional)
    public var fareUrl: String? { return self["agency_fare_url"].asString }     // agency_fare_url  (Optional)

    public required init?(_ row: CSVRow) {
        super.init(row)

        if !row.containsHeadings("agency_name", "agency_url", "agency_timezone") {
            return nil
        }
    }
}
