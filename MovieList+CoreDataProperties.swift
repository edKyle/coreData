//
//  MovieList+CoreDataProperties.swift
//  CoreDataHomeWork
//
//  Created by Kyle on 2016/6/16.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MovieList {

    @NSManaged var movieName: String?
    @NSManaged var movieScore: NSNumber?
    @NSManaged var movieType: String?

}
