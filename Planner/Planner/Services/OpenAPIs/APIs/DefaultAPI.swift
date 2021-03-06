//
// DefaultAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class DefaultAPI {
    /**
     Get employees list
     
     - parameter authorization: (header)  
     - parameter status: (query) Employee status (active inactive all) (optional)
     - parameter _left: (query) working or any or away to show employees that left company (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func employees(authorization: String, status: String? = nil, _left: String? = nil, completion: @escaping ((_ data: [Employee]?,_ error: Error?) -> Void)) {
        employeesWithRequestBuilder(authorization: authorization, status: status, _left: _left).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Get employees list
     - GET /employees
     - parameter authorization: (header)  
     - parameter status: (query) Employee status (active inactive all) (optional)
     - parameter _left: (query) working or any or away to show employees that left company (optional)
     - returns: RequestBuilder<[Employee]> 
     */
    open class func employeesWithRequestBuilder(authorization: String, status: String? = nil, _left: String? = nil) -> RequestBuilder<[Employee]> {
        let path = "/employees"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "status": status?.encodeToJSON(), 
            "left": _left?.encodeToJSON()
        ])
        let nillableHeaders: [String: Any?] = [
            "Authorization": authorization.encodeToJSON()
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<[Employee]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     Authorize user
     
     - parameter inlineObject: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func login(inlineObject: InlineObject, completion: @escaping ((_ data: AuthorizedUser?,_ error: Error?) -> Void)) {
        loginWithRequestBuilder(inlineObject: inlineObject).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Authorize user
     - POST /auth
     - parameter inlineObject: (body)  
     - returns: RequestBuilder<AuthorizedUser> 
     */
    open class func loginWithRequestBuilder(inlineObject: InlineObject) -> RequestBuilder<AuthorizedUser> {
        let path = "/auth"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: inlineObject)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<AuthorizedUser>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
