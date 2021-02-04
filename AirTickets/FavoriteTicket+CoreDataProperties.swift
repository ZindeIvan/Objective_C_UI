//
//  FavoriteTicket+CoreDataProperties.swift
//  AirTickets
//
//  Created by Зинде Иван on 2/4/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//
//

import Foundation
import CoreData


extension FavoriteTicket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteTicket> {
        return NSFetchRequest<FavoriteTicket>(entityName: "FavoriteTicket")
    }

    @NSManaged public var airline: String?
    @NSManaged public var created: Date?
    @NSManaged public var departure: Date?
    @NSManaged public var expires: Date?
    @NSManaged public var flightNumber: Int16
    @NSManaged public var from: String?
    @NSManaged public var price: Int64
    @NSManaged public var returnDate: Date?
    @NSManaged public var to: String?

}
