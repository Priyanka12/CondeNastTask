//
//  ListApiTest.swift
//  TaskCondeNastTests
//
//  Created by Priyanka Saini on 09/04/21.
//

import XCTest
@testable import TaskCondeNast

class ListApiTest: XCTestCase {
    
    let apiRespository = ListResource()
    let listDataResponse : ListResponse? = nil
    
    func testGetNewsListWithExpectedData() {
        
        apiRespository.getTenRecordsOnetime { (response) in
            XCTAssertTrue(((self.listDataResponse?.status!) != nil), "ok")
        }
    }

    func testCheckApiListCountExpectedData() {
        
        apiRespository.getTenRecordsOnetime { (response) in
            XCTAssertNotEqual(self.listDataResponse?.articles?.count, 0)
        }
    }
}
