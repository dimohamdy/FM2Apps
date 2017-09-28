//
//	User.swift


import Foundation 
import ObjectMapper

class User: NSObject, NSCoding, Mappable {

	var age: Int?
	var busId: Int?
	var checkInLocation: String?
	var checkOutLocation: String?
	var gender: Int?
	var location: String?
	var mobileNo: String?
	var organizationId: Int?
	var createdAt: String?
	var email: String?
	var id: Int?
	var name: String?
	var roles: [Role]?
	var stopPointId: Int?
	var updatedAt: String?
	var photoUrl: String?
	var bus: Bus?


	class func newInstance(map: Map) -> Mappable? {
		return User()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		age <- map["Age"]
		busId <- map["BusId"]
		checkInLocation <- map["CheckInLocation"]
		checkOutLocation <- map["CheckOutLocation"]
		gender <- map["Gender"]
		location <- map["Location"]
		mobileNo <- map["MobileNo"]
		organizationId <- map["OrganizationId"]
		photoUrl <- map["PhotoUrl"]
		createdAt <- map["created_at"]
		email <- map["email"]
		id <- map["id"]
		name <- map["name"]
		roles <- map["roles"]
		stopPointId <- map["stopPointId"]
		updatedAt <- map["updated_at"]
		photoUrl <- map["PhotoUrl"]
		bus <- map["bus"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         age = aDecoder.decodeObject(forKey: "Age") as? Int
         busId = aDecoder.decodeObject(forKey: "BusId") as? Int
         checkInLocation = aDecoder.decodeObject(forKey: "CheckInLocation") as? String
         checkOutLocation = aDecoder.decodeObject(forKey: "CheckOutLocation") as? String
         gender = aDecoder.decodeObject(forKey: "Gender") as? Int
         location = aDecoder.decodeObject(forKey: "Location") as? String
         mobileNo = aDecoder.decodeObject(forKey: "MobileNo") as? String
         organizationId = aDecoder.decodeObject(forKey: "OrganizationId") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         roles = aDecoder.decodeObject(forKey: "roles") as? [Role]
         stopPointId = aDecoder.decodeObject(forKey: "stopPointId") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         photoUrl = aDecoder.decodeObject(forKey: "PhotoUrl") as? String
         bus = aDecoder.decodeObject(forKey: "bus") as? Bus

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if age != nil {
			aCoder.encode(age, forKey: "Age")
		}
		if busId != nil {
			aCoder.encode(busId, forKey: "BusId")
		}
		if checkInLocation != nil {
			aCoder.encode(checkInLocation, forKey: "CheckInLocation")
		}
		if checkOutLocation != nil {
			aCoder.encode(checkOutLocation, forKey: "CheckOutLocation")
		}
		if gender != nil {
			aCoder.encode(gender, forKey: "Gender")
		}
		if location != nil {
			aCoder.encode(location, forKey: "Location")
		}
		if mobileNo != nil {
			aCoder.encode(mobileNo, forKey: "MobileNo")
		}
		if organizationId != nil {
			aCoder.encode(organizationId, forKey: "OrganizationId")
		}
		if photoUrl != nil {
			aCoder.encode(photoUrl, forKey: "PhotoUrl")
		}
		if createdAt != nil {
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if email != nil {
			aCoder.encode(email, forKey: "email")
		}
		if id != nil {
			aCoder.encode(id, forKey: "id")
		}
		if name != nil {
			aCoder.encode(name, forKey: "name")
		}
		if roles != nil {
			aCoder.encode(roles, forKey: "roles")
		}
		if stopPointId != nil {
			aCoder.encode(stopPointId, forKey: "stopPointId")
		}
		if updatedAt != nil {
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if photoUrl != nil {
			aCoder.encode(photoUrl, forKey: "PhotoUrl")
		}
		if bus != nil {
			aCoder.encode(bus, forKey: "bus")
		}

	}

}
