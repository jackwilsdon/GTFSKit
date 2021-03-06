//
//  GTFSKit.swift
//  GTFSKit
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

public enum TransferType: Int, CSVEnumeration {
    case Reccomended = 0
    case Timed = 1
    case Minimum = 2
    case None = 3
}

public enum ExceptionType: Int, CSVEnumeration {
    case Added = 1
    case Removed = 2
}

public enum Direction: Int, CSVEnumeration {
    case Forward = 0
    case Backward = 1
}

public enum BoardingType: Int, CSVEnumeration {
    case Regular = 0
    case None = 1
    case MustPhone = 2
    case MustCoordinate = 3
}

public enum Timepoint: Int, CSVEnumeration {
    case Approximate = 0
    case Exact = 1
}

public class GTFSKit {}
