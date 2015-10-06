//
//  Stop.swift
//  GTFSKit
//
//  Created by Jack Wilsdon on 05/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public struct Stop : CSVParsable {
    public let id: String                           // stop_id              (Required)
    public let code: String?                        // stop_code            (Optional)
    public let name: String                         // stop_name            (Required)
    public let desc: String?                        // stop_desc            (Optional)
    public let lat: String                          // stop_lat             (Required)
    public let lon: String                          // stop_lon             (Required)
    public let zoneId: String?                      // zone_id              (Optional)
    public let url: String?                         // stop_url             (Optional)
    public let locationType: LocationType?          // location_type        (Optional)
    public let parentStation: String?               // parent_station       (Optional)
    public let stopTimezone: String?                // stop_timezone        (Optional)
    public let wheelchairBoarding: Accessibility?   // wheelchair_boarding  (Optional)

    public init(id: String, code: String?, name: String, desc: String?, lat: String, lon: String, zoneId: String?, url: String?, locationType: LocationType?, parentStation: String?, stopTimezone: String?, wheelchairBoarding: Accessibility?) {
        self.id = id
        self.code = code
        self.name = name
        self.desc = desc;
        self.lat = lat;
        self.lon = lon;
        self.zoneId = zoneId;
        self.url = url;
        self.locationType = locationType
        self.parentStation = parentStation
        self.stopTimezone = stopTimezone
        self.wheelchairBoarding = wheelchairBoarding
    }

    public static func parse(data: CSVData) -> Stop? {
        if !data.containsColumns("stop_id", "stop_name", "stop_lat", "stop_lon") {
            return nil
        }

        let id = data["stop_id"]!
        let code = data["stop_code"]
        let name = data["stop_name"]!
        let desc = data["stop_desc"]
        let lat = data["stop_lat"]!
        let lon = data["stop_lon"]!
        let zoneId = data["zone_id"]
        let url = data["stop_url"]

        var locationType: LocationType? = nil

        if let locationTypeString = data["location_type"] {
            if let locationTypeValue = Int(locationTypeString) {
                locationType = LocationType(rawValue: locationTypeValue)
            }
        }

        let parentStation = data["parent_station"]
        let stopTimezone = data["stop_timezone"]

        var wheelchairBoarding: Accessibility? = nil

        if let wheelchairBoardingString = data["wheelchair_boarding"] {
            if let wheelchairBoardingValue = Int(wheelchairBoardingString) {
                wheelchairBoarding = Accessibility(rawValue: wheelchairBoardingValue)
            }
        }

        return Stop(id: id, code: code, name: name, desc: desc, lat: lat, lon: lon, zoneId: zoneId, url: url, locationType: locationType, parentStation: parentStation, stopTimezone: stopTimezone, wheelchairBoarding: wheelchairBoarding)
    }

}
