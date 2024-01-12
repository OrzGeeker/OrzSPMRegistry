//
//  File.swift
//
//
//  Created by joker on 2024/1/12.
//

import Vapor

public struct RegistryService {

    public init(with app: Application) {

        // Use the File Middleware to serve the files hosting in Public Directory
        let publicFileMiddleware = FileMiddleware(publicDirectory: app.directory.publicDirectory)
        app.middleware.use(publicFileMiddleware)

        // Create a VaporTransport using your application.
        let transport = VaporTransport(routesBuilder: app)

        // Call the generated function on your implementation to add its request
        // handlers to the app.
        do {
            try self.registerHandlers(on: transport, serverURL: Servers.server1())
        } catch {
            fatalError("registerHandlers failed")
        }
    }
}

import OpenAPIRuntime
import OpenAPIVapor

/// https://swiftpackageindex.com/apple/swift-openapi-generator/1.2.0/tutorials/swift-openapi-generator/serverswiftpm
extension RegistryService: APIProtocol {

    func lookupPackageIdentifiersByURL(_ input: Operations.lookupPackageIdentifiersByURL.Input) async throws -> Operations.lookupPackageIdentifiersByURL.Output {
        return .ok(.init(headers: .init(Content_hyphen_Version: ._1), body: .json(.init(identifiers: []))))
    }

    func downloadSourceArchive(_ input: Operations.downloadSourceArchive.Input) async throws -> Operations.downloadSourceArchive.Output {
        return .ok(.init(headers: .init(Digest: ""), body: .application_zip(.init())))
    }

    func fetchManifestForPackageRelease(_ input: Operations.fetchManifestForPackageRelease.Input) async throws -> Operations.fetchManifestForPackageRelease.Output {
        return .ok(.init(body: .text_x_hyphen_swift(.init())))
    }

    func publishPackageRelease(_ input: Operations.publishPackageRelease.Input) async throws -> Operations.publishPackageRelease.Output {
        return .accepted(.init(headers: .init(Content_hyphen_Version: ._1)))
    }


    func fetchReleaseMetadata(_ input: Operations.fetchReleaseMetadata.Input) async throws -> Operations.fetchReleaseMetadata.Output {
        return .ok(.init(headers: .init(Content_hyphen_Version: ._1), body: .json(.init())))
    }


    func listPackageReleases(_ input: Operations.listPackageReleases.Input) async throws -> Operations.listPackageReleases.Output {
        return .ok(.init(headers: .init(Content_hyphen_Version: ._1), body: .json(.init(releases: .init()))))
    }
}
