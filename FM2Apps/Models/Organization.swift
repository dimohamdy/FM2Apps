//
//	Organization.swift


import Foundation 
import ObjectMapper

class Organization: NSObject, NSCoding, Mappable {

	var busesCount: Int?
	var id: Int?
	var name: String?
	var usersCount: Int?
	var createdAt: String?
	var phoneNumber: String?
	var updatedAt: String?


	class func newInstance(map: Map) -> Mappable? {
		return Organization()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		busesCount <- map["BusesCount"]
		id <- map["Id"]
		name <- map["Name"]
		usersCount <- map["UsersCount"]
		createdAt <- map["created_at"]
		phoneNumber <- map["phoneNumber"]
		updatedAt <- map["updated_at"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         busesCount = aDecoder.decodeObject(forKey: "BusesCount") as? Int
         id = aDecoder.decodeObject(forKey: "Id") as? Int
         name = aDecoder.decodeObject(forKey: "Name") as? String
         usersCount = aDecoder.decodeObject(forKey: "UsersCount") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         phoneNumber = aDecoder.decodeObject(forKey: "phoneNumber") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if busesCount != nil {
			aCoder.encode(busesCount, forKey: "BusesCount")
		}
		if id != nil {
			aCoder.encode(id, forKey: "Id")
		}
		if name != nil {
			aCoder.encode(name, forKey: "Name")
		}
		if usersCount != nil {
			aCoder.encode(usersCount, forKey: "UsersCount")
		}
		if createdAt != nil {
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if phoneNumber != nil {
			aCoder.encode(phoneNumber, forKey: "phoneNumber")
		}
		if updatedAt != nil {
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}