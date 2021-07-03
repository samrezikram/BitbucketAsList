//
//  BitbucketAsListTests.swift
//  BitbucketAsListTests
//
//  Created by Samrez Ikram on 02/07/2021.
//

import XCTest
@testable import BitbucketAsList

class BitbucketAsListTests: XCTestCase {
    var sut: URLSession!
    var networkMonitor = InternetConnectionManager.sharedInstance

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = URLSession(configuration: .default)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testApiCallCompletes() throws {
        try XCTSkipUnless(
            true)
      // given
        let sourcesURL = URL(string: "https://api.bitbucket.org/2.0/repositories")!
      let promise = expectation(description: "Completion handler invoked")
      var statusCode: Int?
      var responseError: Error?

      // when
      let dataTask = sut.dataTask(with: sourcesURL) { responseData, response, error in
        statusCode = (response as? HTTPURLResponse)?.statusCode
        responseError = error
        let jsonDecoder = JSONDecoder()
        let publicRepos = try! jsonDecoder.decode(BitBucketRepository.self, from: responseData!)
        
        publicRepos.values.forEach { (result:Values) in
            
            if let title = result.owner?.display_name, let type =  result.owner?.type, let creationDate = result.created_on {
                if ( title.isEmpty || type.isEmpty || creationDate.isEmpty){
                    XCTAssertThrowsError("value or null")
                }
            }
        }
        promise.fulfill()
      }
      dataTask.resume()
      wait(for: [promise], timeout: 10)

      // then
      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, 200)
    }
}
