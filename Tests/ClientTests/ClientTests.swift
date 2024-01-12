import XCTest
@testable import Client

final class ClientTests: XCTestCase {

    func testClient() throws {
        XCTAssertNotNil(RegistryClient.client)
    }
}
