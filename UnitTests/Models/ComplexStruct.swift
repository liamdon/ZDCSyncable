/// ZDCSyncable
/// https://github.com/4th-ATechnologies/ZDCSyncable
///
/// Undo, redo & merge capabilities for structs & classes in pure Swift.

import Foundation
import ZDCSyncable

struct ComplexStruct: ZDCSyncable, Equatable {
	
	@Syncable var someString: String
	@Syncable var someInteger: Int
	
	var dict = ZDCDictionary<String, String>()
	
	static func == (lhs: ComplexStruct, rhs: ComplexStruct) -> Bool {
		
		return
			(lhs.someString == rhs.someString) &&
			(lhs.someInteger == rhs.someInteger) &&
		   (lhs.dict == rhs.dict)
	}
	
	// MARK: ZDCRecord
	
	/// You must implement this function IFF you have ZDCSyncable properties such as:
	/// - ZDCDictionary
	/// - ZDCOrderedDictionary
	/// - ZDCSet
	/// - ZDCOrderedSet
	/// - ZDCArray
	///
	mutating func setSyncableValue(_ value: Any?, for key: String) -> Bool {
		
		var result = false
		switch key {
		case "dict":
			
			if let value = value as? ZDCDictionary<String, String> {
				dict = value
				result = true
			}
			
		default: break
		}
		
		return result
	}
}
