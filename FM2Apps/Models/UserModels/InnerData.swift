//
//	InnerData.swift


import Foundation 
import ObjectMapper

class InnerData: NSObject, NSCoding, Mappable {

	var token: String?
	var user: User?


	class func newInstance(map: Map) -> Mappable? {
		return InnerData()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		token <- map["token"]
		user <- map["user"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         token = aDecoder.decodeObject(forKey: "token") as? String
         user = aDecoder.decodeObject(forKey: "user") as? User

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if token != nil {
			aCoder.encode(token, forKey: "token")
		}
		if user != nil {
			aCoder.encode(user, forKey: "user")
		}

	}

}