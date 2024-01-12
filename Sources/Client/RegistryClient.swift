//
//  RegistryClient.swift
//
//
//  Created by joker on 2024/1/12.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

/// https://swiftpackageindex.com/apple/swift-openapi-generator/1.2.0/tutorials/swift-openapi-generator/clientswiftpm
struct RegistryClient {

    static let client: Client? = {
        do {
            let client = Client(serverURL: try Servers.server1(), transport: URLSessionTransport())
            return client
        } catch {
            return nil
        }
    }()
}
