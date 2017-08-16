//
//  RealmHelper.swift
//  RealmHelper
//
//  Created by BLU on 2017. 8. 7..
//  Copyright © 2017년 futr_blu. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmHelper: NSObject {
    
    private static var realm: Realm {
        return try! Realm()
    }
    
    class func add<T: Object>(data: T) {
        
        try! realm.write {
            realm.add(data)
        }
    }
    
    class func add<T: Object>(datas: Array<T>) {
        
        try! realm.write {
            for data in datas {
                realm.add(data)
            }
        }
    }
    
    class func fetchFromType<T: Object>(of: T) -> Results<T> {
        let results = realm.objects(T.self)
        
        return results
    }
    
    class func fetchFromType<T: Object>(of: T, with query: NSPredicate) -> Results<T> {
        let results = realm.objects(T.self).filter(query)
        
        return results
    }
    
    class func remove<T: Object>(data: T) {
        
        try! realm.write {
            realm.delete(data)
        }
    }
    
    class func removeAll() {
        
        try! realm.write {
            realm.deleteAll()
        }
        
    }
    
//    class func objectFromType<T: Object>(of data: T) -> Results<T> {
//
//        return realm.objects(T.self)
//    }
    
//    class func objectFromType<T: Object>(of data: T, from query: NSPredicate) -> T? {
//        guard let object = realm.objects(T.self).filter("id = 1").first else {
//            return nil
//        }
//
//        return object
//    }
    
//    class func updateObject<T: Object>(data: T, query: NSPredicate) {
//
//        var object = realm.objects(T.self).filter("id = 1").first
//        object = data
//
//        try! realm.write {
//            realm.add(data, update: true)
//        }
//    }
    
//    class func updateData<T: Object>(data: T, query: NSPredicate) {
//        
//        try! realm.write {
//            realm.add(updateTask)
//        }
//    }
    
}
