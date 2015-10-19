//
//  Stop.swift
//  GTFSKit
//

import Foundation
import CoreLocation

public struct Stop: CSVParsable {
    public let id: String                           // stop_id              (Required)
    public let code: String?                        // stop_code            (Optional)
    public let name: String                         // stop_name            (Required)
    public let desc: String?                        // stop_desc            (Optional)
    public let location: CLLocationCoordinate2D     // stop_lat, stop_lon   (Required)
    public let zoneId: String?                      // zone_id              (Optional)
    public let url: String?                         // stop_url             (Optional)
    public let locationType: LocationType?          // location_type        (Optional)
    public let parentStation: String?               // parent_station       (Optional)
    public let stopTimezone: String?                // stop_timezone        (Optional)
    public let wheelchairBoarding: Accessibility?   // wheelchair_boarding  (Optional)

    public init(id: String, code: String?, name: String, desc: String?, location: CLLocationCoordinate2D, zoneId: String?, url: String?, locationType: LocationType?, parentStation: String?, stopTimezone: String?, wheelchairBoarding: Accessibility?) {
        self.id = id
        self.code = code
        self.name = name
        self.desc = desc
        self.location = location
        self.zoneId = zoneId
        self.url = url
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
        let location = CLLocationCoordinate2D(latitude: (data["stop_lat"]! as NSString).doubleValue, longitude: (data["stop_lon"]! as NSString).doubleValue)
        let zoneId = data["zone_id"]
        let url = data["stop_url"]

        let locationType = data.get("location_type", parser: LocationType.fromString(LocationType.Stop))

        let parentStation = data["parent_station"]
        let stopTimezone = data["stop_timezone"]

        let wheelchairBoarding: Accessibility? = data.get("wheelchair_boarding", parser: Accessibility.fromString(Accessibility.Unknown))

        return Stop(id: id, code: code, name: name, desc: desc, location: location, zoneId: zoneId, url: url, locationType: locationType, parentStation: parentStation, stopTimezone: stopTimezone, wheelchairBoarding: wheelchairBoarding)
    }

}
