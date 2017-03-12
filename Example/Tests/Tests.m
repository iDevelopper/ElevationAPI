//
//  ElevationAPITests.m
//  ElevationAPITests
//
//  Created by iDevelopper on 03/12/2017.
//  Copyright (c) 2017 iDevelopper. All rights reserved.
//

@import XCTest;
#import <Elevation.h>

@interface Tests : XCTestCase

@property (nonatomic) Elevation *elevation;

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.elevation = [[Elevation alloc] initWithBaseUrl:nil andApiVersion:nil];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSArray *array = @[@[@44.582352, @6.695185],
                       @[@44.582879, @6.696953],
                       @[@44.584711, @6.697369],
                       @[@44.585488, @6.697193],
                       @[@44.587027, @6.695611]
                       ];
    NSArray *expectedResult = @[@2058, @2038, @1999, @1966, @1914];
    
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"getElevations:completionHandler method"];
    [_elevation getElevations:array completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        XCTAssertEqualObjects(expectedResult, result, @"Result was not correct!");
        [completionExpectation fulfill];
        
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    NSArray *array = @[@[@44.582352, @6.695185],
                       @[@44.582879, @6.696953],
                       @[@44.584711, @6.697369],
                       @[@44.585488, @6.697193],
                       @[@44.587027, @6.695611]
                       ];
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [_elevation getElevations:array completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        }];
    }];
}

@end

