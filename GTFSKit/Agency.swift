//
//  Agency.swift
//  GTFSKit
//

import Foundation

public struct Agency : CSVParsable {
    public let id: String?      // agency_id        (Optional)
    public let name: String     // agency_name      (Required)
    public let url: String      // agency_url       (Required)
    public let timezone: String // agency_timezone  (Required)
    public let lang: String?    // agency_lang      (Optional)
    public let phone: String?   // agency_phone     (Optional)
    public let fareUrl: String? // agency_fare_url  (Optional)

    public init(id: String?, name: String, url: String, timezone: String, lang: String?, phone: String?, fareUrl: String?) {
        self.id = id
        self.name = name
        self.url = url
        self.timezone = timezone
        self.lang = lang
        self.phone = phone
        self.fareUrl = fareUrl
    }

    public static func parse(data: CSVData) -> Agency? {
        if !data.containsColumns("agency_name", "agency_url", "agency_timezone") {
            return nil
        }

        let id = data["agency_id"]
        let name = data["agency_name"]!
        let url = data["agency_url"]!
        let timezone = data["agency_timezone"]!
        let lang = data["agency_lang"]
        let phone = data["agency_phone"]
        let fareUrl = data["agency_fare_url"]

        return Agency(id: id, name: name, url: url, timezone: timezone, lang: lang, phone: phone, fareUrl: fareUrl)
    }

}
