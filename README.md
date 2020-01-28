# SwiftRealm--
## Description
* A solution to reduce realm (swift) tedious write commit coding.一套减少Realm写入事务代码量的三方解决方案。
* No `closure`, no `beginWrite`, no `commitWrite`.You can return method anywhere.
* [Realm--](https://github.com/Meterwhite/Realm-- "Realm--") for Objective-C

## CocoaPods
```
pod 'SwiftRealm--'
```
## Realm commit scope
- Realm transaction will be committed when leaving current scope.
- 写事务将在离开当前作用域时自动提交.
### Writing scope
```swift
A scope {
    let writing = RLLWriting()
    writing.auto()
    ...
    <RLMObject>.key = value
}
```
## Realm commit pool
- Commit pool definitions ensure commits transaction to default realm when leaving pool scope.
- 提交池确保了离开作用域时进行提交到default realm。
### Writing pool
```swift
realm_writing_pool { writing in
    let results = writing.objects(...)
    writing.add[s](...).update[s](...).deletes(...)...
}
```

## Switch realm
- Change realm of current scope.It will try to commit the previous transaction.
```swift
let writing = RLLWriting()
...
writing.realm = <Realm>
/// Scope of new realm ⤵️
...
```
