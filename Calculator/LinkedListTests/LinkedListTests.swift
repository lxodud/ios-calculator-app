//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Hamo on 2022/09/20.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<String>!

    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testLinkedList_문자열을_append했을때_해당문자열이잘들어가야한다() {
        sut.append("HI")
        
        let result = sut.head?.data

        XCTAssertEqual(result, "HI")
    }
    
    func testLinkedList_비어있는LinkedList에_isEmpty를_호출했을때_정확한Bool값이나와야한다() {
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func testLinkedList_문자열3개를_append한후_removeAll을이용하여전부삭제돼야한다() {
        sut.append("HI")
        sut.append("HO")
        sut.append("HU")
        sut.removeAll()
        
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func testLinkedList_LinkedList_가비었을때_removeFirst를하면_nil이나와야한다() {
        let result = sut.removeFirst()
        
        XCTAssertNil(result)
    }
    
    func testLinkedList_removeFirst를했을때_제일앞에요소가나와야한다() {
        sut.append("HI")
        
        let result = sut.removeFirst()
        
        XCTAssertEqual(result, "HI")
    }
}

