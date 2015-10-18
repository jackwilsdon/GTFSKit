//
//  GTFSKitTests.swift
//  GTFSKitTests
//

import XCTest
@testable import GTFSKit

class GTFSKitTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testStopsPerformance() {
        self.measureBlock {
            let parser = CSVParser(lines: ["stop_id,stop_name,stop_desc,stop_lat,stop_lon,stop_url,location_type,parent_station", "S1,Mission St. & Silver Ave.,The stop is located at the southwest corner of the intersection.,37.728631,-122.431282,,,", "S2,Mission St. & Cortland Ave.,The stop is located 20 feet south of Mission St.,37.74103,-122.422482,,,", "S8,24th St. Mission Station,,37.752240,-122.418450,http://www.bart.gov/stations/stationguide/stationoverview_24st.asp,1,"])
            parser.parse(Stop)
        }
    }

    func testCalendarPerformance() {
        self.measureBlock {
            let parser = CSVParser(lines: ["service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date", "WE,0,0,0,0,0,1,1,20060701,20060731", "WD,1,1,1,1,1,0,0,20060701,20060731"])
            parser.parse(Calendar)
        }
    }

    func testTransferPerformance() {
        self.measureBlock {
            let parser = CSVParser(lines: ["from_stop_id,to_stop_id,transfer_type,min_transfer_time", "S6,S7,2,300", "S7,S6,3,", "S23,S7,1,"])
            parser.parse(Transfer)
        }
    }

}
