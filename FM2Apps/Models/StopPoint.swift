//
//	StopPoint.swift


import Foundation 
import ObjectMapper

class StopPoint: NSObject, NSCoding, Mappable {

	var id: Int?
	var createdAt: String?
	var lat: Float?
	var lng: Float?
	var minsfromprevious: Int?
	var northEastLat: Float?
	var northEastLng: Float?
	var routeId: Int?
	var southWestLat: Float?
	var southWestLng: Float?
	var updatedAt: String?
	var users: [User]?


	class func newInstance(map: Map) -> Mappable? {
		return StopPoint()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		id <- map["Id"]
		createdAt <- map["created_at"]
		lat <- map["lat"]
		lng <- map["lng"]
		minsfromprevious <- map["minsfromprevious"]
		northEastLat <- map["northEast_lat"]
		northEastLng <- map["northEast_lng"]
		routeId <- map["routeId"]
		southWestLat <- map["southWest_lat"]
		southWestLng <- map["southWest_lng"]
		updatedAt <- map["updated_at"]
		users <- map["users"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         id = aDecoder.decodeObject(forKey: "Id") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         lat = aDecoder.decodeObject(forKey: "lat") as? Float
         lng = aDecoder.decodeObject(forKey: "lng") as? Float
         minsfromprevious = aDecoder.decodeObject(forKey: "minsfromprevious") as? Int
         northEastLat = aDecoder.decodeObject(forKey: "northEast_lat") as? Float
         northEastLng = aDecoder.decodeObject(forKey: "northEast_lng") as? Float
         routeId = aDecoder.decodeObject(forKey: "routeId") as? Int
         southWestLat = aDecoder.decodeObject(forKey: "southWest_lat") as? Float
         southWestLng = aDecoder.decodeObject(forKey: "southWest_lng") as? Float
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
		if createdAt != nil {
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if lat != nil {
			aCoder.encode(lat, forKey: "lat")
		}
		if lng != nil {
			aCoder.encode(lng, forKey: "lng")
		}
		if minsfromprevious != nil {
			aCoder.encode(minsfromprevious, forKey: "minsfromprevious")
		}
		if northEastLat != nil {
			aCoder.encode(northEastLat, forKey: "northEast_lat")
		}
		if northEastLng != nil {
			aCoder.encode(northEastLng, forKey: "northEast_lng")
		}
		if routeId != nil {
			aCoder.encode(routeId, forKey: "routeId")
		}
		if southWestLat != nil {
			aCoder.encode(southWestLat, forKey: "southWest_lat")
		}
		if southWestLng != nil {
			aCoder.encode(southWestLng, forKey: "southWest_lng")
		}
		if updatedAt != nil {
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if users != nil {
			aCoder.encode(users, forKey: "users")
		}

	}

}