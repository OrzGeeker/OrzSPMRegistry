//
//  main.swift
//
//
//  Created by joker on 2024/1/12.
//

import Vapor
import Service

// Create your Vapor application.
let app = Vapor.Application()

// Create an instance of your handler type that conforms the generated protocol
// defininig your service API.
let handler = RegistryService(with: app)

// Start the app as you would normally.
try await app.execute()
