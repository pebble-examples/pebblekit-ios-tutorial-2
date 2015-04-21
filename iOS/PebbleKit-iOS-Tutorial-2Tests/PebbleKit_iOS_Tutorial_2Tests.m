//
//  PebbleKit_iOS_Tutorial_2Tests.m
//  PebbleKit-iOS-Tutorial-2Tests
//
//  Created by Chris Lewis on 1/13/15.
//  Copyright (c) 2015 Pebble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface PebbleKit_iOS_Tutorial_2Tests : XCTestCase

@end

@implementation PebbleKit_iOS_Tutorial_2Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
