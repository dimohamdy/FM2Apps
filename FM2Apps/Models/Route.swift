//
//	Route.swift


import Foundation 
import ObjectMapper

class Route: NSObject, NSCoding, Mappable {

	var id: Int?
	var createdAt: String?
	var dropoffLocation: DropoffLocation?
	var name: String?
	var pickupLocation: DropoffLocation?
	var routePath: [DropoffLocation]?
	var stopPoints: [StopPoint]?
	var updatedAt: String?


	class func newInstance(map: Map) -> Mappable? {
		return Route()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		id <- map["Id"]
		createdAt <- map["created_at"]
		dropoffLocation <- map["dropoffLocation"]
		name <- map["name"]
		pickupLocation <- map["pickupLocation"]
		routePath <- map["routePath"]
		stopPoints <- map["stop_points"]
		updatedAt <- map["updated_at"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         id = aDecoder.decodeObject(forKey: "Id") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         dropoffLocation = aDecoder.decodeObject(forKey: "dropoffLocation") as? DropoffLocation
         name = aDecoder.decodeObject(forKey: "name") as? String
         pickupLocation = aDecoder.decodeObject(forKey: "pickupLocation") as? DropoffLocation
         routePath = aDecoder.decodeObject(forKey: "routePath") as? [DropoffLocation]
         stopPoints = aDecoder.decodeObject(forKey: "stop_points") as? [StopPoint]
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if id != nil {
			aCoder.encode(id, forKey: "Id")
		}
		if createdAt != nil {
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if dropoffLocation != nil {
			aCoder.encode(dropoffLocation, forKey: "dropoffLocation")
		}
		if name != nil {
			aCoder.encode(name, forKey: "name")
		}
		if pickupLocation != nil {
			aCoder.encode(pickupLocation, forKey: "pickupLocation")
		}
		if routePath != nil {
			aCoder.encode(routePath, forKey: "routePath")
		}
		if stopPoints != nil {
			aCoder.encode(stopPoints, forKey: "stop_points")
		}
		if updatedAt != nil {
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}