//
//  Transfer.swift
//  GTFSKit
//
//  Created by Rocky Breslow on 10/16/15.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public struct Transfer: CSVParsable {
    public let fromStopId: String                   // from_stop_id              (Required)
    public let toStopId: String                     // to_stop_id                (Required)
    public let transferType: TransferType           // transfer_type             (Required)
    public let minTransferTime: Int?                // min_transfer_time         (Optional)

    public init(fromStopId: String, toStopId: String, transferType: TransferType, minTransferTime: Int?) {
        self.fromStopId = fromStopId
        self.toStopId = toStopId
        self.transferType = transferType
        self.minTransferTime = minTransferTime
    }

    public static func parse(data: CSVData) -> Transfer? {
        if !data.containsColumns("from_stop_id", "to_stop_id", "transfer_type") {
            return nil
        }

        let fromStopId = data["from_stop_id"]!
        let toStopId = data["to_stop_id"]!

        let transferType = data.get("transfer_type", parser: TransferType.fromString(TransferType.Reccomended))!

        var minTransferTime: Int? = nil
        if let minTransferTimeStr = data["min_transfer_time"] {
            minTransferTime = Int(minTransferTimeStr)
        }

        return Transfer(fromStopId: fromStopId, toStopId: toStopId, transferType: transferType, minTransferTime: minTransferTime)
    }

}
