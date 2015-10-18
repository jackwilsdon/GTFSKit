//
//  Route.swift
//  GTFSKit
//
//  Created by Jack Wilsdon on 05/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public struct Route : CSVParsable {
    public let id: String           // route_id         (Required)
    public let agencyId: String?    // agency_id        (Optional)
    public let shortName: String    // route_short_name (Required)
    public let longName: String     // route_long_name  (Required)
    public let desc: String?        // route_desc       (Optional)
    public let type: RouteType      // route_type       (Required)
    public let url: String?         // route_url        (Optional)
    public let color: String?       // route_color      (Optional)
    public let textColor: String?   // route_text_color (Optional)

    public init(id: String, agencyId: String?, shortName: String, longName: String, desc: String?, type: RouteType, url: String?, color: String?, textColor: String?) {
        self.id = id
        self.agencyId = agencyId
        self.shortName = shortName
        self.longName = longName
        self.desc = desc
        self.type = type
        self.url = url
        self.color = color
        self.textColor = textColor
    }

    public static func parse(data: CSVData) -> Route? {
        if !data.containsColumns("route_id", "route_short_name", "route_long_name", "route_type") {
            return nil
        }

        let id = data["route_id"]!
        let agencyId = data["agency_id"]
        let shortName = data["route_short_name"]!
        let longName = data["route_long_name"]!
        let desc = data["route_desc"]

        guard let type = data.get("route_type", parser: RouteType.fromString) else {
            return nil
        }

        let url = data["route_url"]
        let color = data["route_color"]
        let textColor = data["route_text_color"]

        return Route(id: id, agencyId: agencyId, shortName: shortName, longName: longName, desc: desc, type: type, url: url, color: color, textColor: textColor)
    }

}
