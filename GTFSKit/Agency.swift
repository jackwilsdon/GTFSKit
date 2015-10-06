//
//  Agency.swift
//  GTFSKit
//
//  Created by Jack Wilsdon on 05/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
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
        let id = data["agency_id"]
        
        guard let name = data["agency_name"] else {
            return nil
        }
        
        guard let url = data["agency_url"] else {
            return nil
        }
        
        guard let timezone = data["agency_timezone"] else {
            return nil
        }
    
        let lang = data["agency_lang"]
        let phone = data["agency_phone"]
        let fareUrl = data["agency_fare_url"]
        
        return Agency(id: id, name: name, url: url, timezone: timezone, lang: lang, phone: phone, fareUrl: fareUrl)
    }

}