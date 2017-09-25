//
//	ContentInnerData.swift


import Foundation 
import ObjectMapper

class ContentInnerData: NSObject, NSCoding, Mappable {

	var id: Int?
	var content: String?
	var createdAt: String?
	var updatedAt: String?


	class func newInstance(map: Map) -> Mappable? {
		return ContentInnerData()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		id <- map["Id"]
		content <- map["content"]
		createdAt <- map["created_at"]
		updatedAt <- map["updated_at"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         id = aDecoder.decodeObject(forKey: "Id") as? Int
         content = aDecoder.decodeObject(forKey: "content") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
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
		if content != nil {
			aCoder.encode(content, forKey: "content")
		}
		if createdAt != nil {
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if updatedAt != nil {
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}