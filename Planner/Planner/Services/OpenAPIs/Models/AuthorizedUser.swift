//
// AuthorizedUser.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct AuthorizedUser: Codable {

    public var token: String?
    public var user: Employee?

    public init(token: String?, user: Employee?) {
        self.token = token
        self.user = user
    }


}
