//
//	Pivot.swift


import Foundation 
import ObjectMapper

class Pivot: NSObject, NSCoding, Mappable {

	var roleId: Int?
	var userId: Int?


	class func newInstance(map: Map) -> Mappable? {
		return Pivot()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		roleId <- map["role_id"]
		userId <- map["user_id"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         roleId = aDecoder.decodeObject(forKey: "role_id") as? Int
         userId = aDecoder.decodeObject(forKey: "user_id") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if roleId != nil {
			aCoder.encode(roleId, forKey: "role_id")
		}
		if userId != nil {
			aCoder.encode(userId, forKey: "user_id")
		}

	}

}