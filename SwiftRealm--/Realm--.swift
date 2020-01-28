//
//  Realm--.swift
//  Realm--
//
//  Created by MeterWhite on 2020/1/26.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

import RealmSwift

typealias RLLWritingBlock = (_ writing : RLLWriting) -> ()

// MARK: - Pool
func realm_writing_pool(_ block : RLLWritingBlock) {
    block(RLLWriting())
}

// MARK: - Scope
/// Realm less less
class RLLWriting {
    
    /// Debug log
    public static var delogEnable = true
    
    /// Set to switch realm.
    public var realm : Realm! {
        didSet {
            if oldValue != nil {
                if oldValue.isInWriteTransaction {
                    if let nots = withoutNotifying {
                        try! oldValue.commitWrite(withoutNotifying: nots)
                        withoutNotifying = nil
                    } else {
                        try! oldValue.commitWrite()
                    }
                    debugPrint("Realm--: commitWrite")
                }
            }
            if !realm.isInWriteTransaction {
                realm.beginWrite()
                debugPrint("Realm--: beginWrite")
            }
        }
    }
    
    public var withoutNotifying : [NotificationToken]?
    
    init() {
        realm = try! Realm()
        if !realm.isInWriteTransaction {
            realm.beginWrite()
            debugPrint("Realm--: beginWrite")
        }
    }
    
    deinit {
        if realm.isInWriteTransaction {
            if let nots = withoutNotifying {
                try! realm.commitWrite(withoutNotifying: nots)
                withoutNotifying = nil
            } else {
                try! realm.commitWrite()
            }
            debugPrint("Realm--: commitWrite")
        }
        realm = nil
        withoutNotifying = nil
    }
    
    // MARK: - Auto commit
    /// Swift has no way to eliminate the warning of 'unused variables'.So use it.
    public func auto () {
        /// ...
    }
}

// MARK: - Datas
extension RLLWriting {
    
    // MARK: - Select
    public func objects<Element: Object>(_ type: Element.Type) -> Results<Element> {
        return realm.objects(type)
    }
    
    // MARK: - Update
    public func update(_ obj : Object) -> RLLWriting {
        realm.add(obj, update: .modified)
        return self
    }
    
    public func updates<T: Sequence>(_ objs: T) -> RLLWriting where T.Iterator.Element: Object {
        realm.add(objs, update: .modified)
        return self
    }
    
    // MARK: - Add
    public func add(_ obj : Object) -> RLLWriting {
        realm.add(obj)
        return self
    }
    
    public func adds<T: Sequence>(_ objs: T) -> RLLWriting where T.Iterator.Element: Object {
        realm.add(objs)
        return self
    }
    
    // MARK: - Delete
    public func delete(_ obj : Object) -> RLLWriting {
        realm.delete(obj)
        return self
    }
    
    public func deletes<T: Sequence>(_ objs: T) -> RLLWriting where T.Iterator.Element: Object {
        realm.delete(objs)
        return self
    }
    
    public func deletes<Element: Object>(_ objs: List<Element>) -> RLLWriting {
        realm.delete(objs)
        return self
    }
    
    public func deletes<Element: Object>(_ objs: Results<Element>) -> RLLWriting {
        realm.delete(objs)
        return self
    }
}
