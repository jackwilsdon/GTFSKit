//
//  GTFSKit.swift
//  GTFSKit
//
//  Created by Jack Wilsdon on 05/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public enum LocationType: Int, CSVEnumeration {
    case Stop = 0
    case Station = 1
}

public enum Accessibility: Int, CSVEnumeration {
    case Unknown = 0
    case Some = 1
    case None = 2
}

public enum RouteType: Int, CSVEnumeration {
    case Street = 0
    case Underground = 1
    case Rail = 2
    case Bus = 3
    case Ferry = 4
    case Cable = 5
    case Suspended = 6
    case InclineRail = 7
}

public enum Direction: Int, CSVEnumeration {
    case Forward = 0
    case Backward = 1
}

public class GTFSKit {}
