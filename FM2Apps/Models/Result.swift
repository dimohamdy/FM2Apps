//
//	Result.swift


import Foundation 
import ObjectMapper

class Result: NSObject, NSCoding, Mappable {

	var innerData: InnerData?
	var message: String?
	var status: Bool?


	class func newInstance(map: Map) -> Mappable? {
		return Result()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		innerData <- map["InnerData"]
		message <- map["Message"]
		status <- map["Status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         innerData = aDecoder.decodeObject(forKey: "InnerData") as? InnerData
         message = aDecoder.decodeObject(forKey: "Message") as? String
         status = aDecoder.decodeObject(forKey: "Status") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if innerData != nil {
			aCoder.encode(innerData, forKey: "InnerData")
		}
		if message != nil {
			aCoder.encode(message, forKey: "Message")
		}
		if status != nil {
			aCoder.encode(status, forKey: "Status")
		}

	}

}