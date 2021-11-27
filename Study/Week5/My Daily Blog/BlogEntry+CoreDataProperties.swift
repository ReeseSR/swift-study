//
//  BlogEntry+CoreDataProperties.swift
//  My Daily Blog
//
//  Created by 배소린 on 2021/11/27.
//
//

import Foundation
import CoreData


extension BlogEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BlogEntry> {
        return NSFetchRequest<BlogEntry>(entityName: "BlogEntry")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?

}

extension BlogEntry : Identifiable {

}
