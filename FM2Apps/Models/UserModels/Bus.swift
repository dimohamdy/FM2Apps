//
//	Bus.swift


import Foundation 
import ObjectMapper

class Bus: NSObject, NSCoding, Mappable {

	var id: Int?
	var busNumber: String?
	var capacity: Int?
	var createdAt: String?
	var isactive: Int?
	var organization: Organization?
	var organizationId: Int?
	var route: Route?
	var routeId: Int?
	var supervisor: Supervisor?
	var supervisorId: Int?
	var updatedAt: String?
	var users: [User]?


	class func newInstance(map: Map) -> Mappable? {
		return Bus()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		id <- map["Id"]
		busNumber <- map["busNumber"]
		capacity <- map["capacity"]
		createdAt <- map["created_at"]
		isactive <- map["isactive"]
		organization <- map["organization"]
		organizationId <- map["organizationId"]
		route <- map["route"]
		routeId <- map["routeId"]
		supervisor <- map["supervisor"]
		supervisorId <- map["supervisorId"]
		updatedAt <- map["updated_at"]
		users <- map["users"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         id = aDecoder.decodeObject(forKey: "Id") as? Int
         busNumber = aDecoder.decodeObject(forKey: "busNumber") as? String
         capacity = aDecoder.decodeObject(forKey: "capacity") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         isactive = aDecoder.decodeObject(forKey: "isactive") as? Int
         organization = aDecoder.decodeObject(forKey: "organization") as? Organization
         organizationId = aDecoder.decodeObject(forKey: "organizationId") as? Int
         route = aDecoder.decodeObject(forKey: "route") as? Route
         routeId = aDecoder.decodeObject(forKey: "routeId") as? Int
         supervisor = aDecoder.decodeObject(forKey: "supervisor") as? Supervisor
         supervisorId = aDecoder.decodeObject(forKey: "supervisorId") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         users = aDecoder.decodeObject(forKey: "users") as? [User]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if id != nil {
			aCoder.encode(id, forKey: "Id")
		}
		if busNumber != nil {
			aCoder.encode(busNumber, forKey: "busNumber")
		}
		if capacity != nil {
			aCoder.encode(capacity, forKey: "capacity")
		}
		if createdAt != nil {
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if isactive != nil {
			aCoder.encode(isactive, forKey: "isactive")
		}
		if organization != nil {
			aCoder.encode(organization, forKey: "organization")
		}
		if organizationId != nil {
			aCoder.encode(organizationId, forKey: "organizationId")
		}
		if route != nil {
			aCoder.encode(route, forKey: "route")
		}
		if routeId != nil {
			aCoder.encode(routeId, forKey: "routeId")
		}
		if supervisor != nil {
			aCoder.encode(supervisor, forKey: "supervisor")
		}
		if supervisorId != nil {
			aCoder.encode(supervisorId, forKey: "supervisorId")
		}
		if updatedAt != nil {
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if users != nil {
			aCoder.encode(users, forKey: "users")
		}

	}

}
