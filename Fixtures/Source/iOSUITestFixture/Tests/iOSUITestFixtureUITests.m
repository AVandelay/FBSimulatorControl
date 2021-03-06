/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <XCTest/XCTest.h>

@interface iOSUITestFixtureUITests : XCTestCase
@end

@implementation iOSUITestFixtureUITests

- (void)setUp
{
  [super setUp];
  self.continueAfterFailure = NO;
  [[XCUIApplication new] launch];
}

- (void)testHelloWorld
{
  XCUIApplication *app = [XCUIApplication new];
  XCUIElement *button = app.buttons[@"Welcome"];
  [self expectationForPredicate:[NSPredicate predicateWithFormat:@"exists = 1 && hittable = 1"]
            evaluatedWithObject:button
                        handler:^BOOL{
                          [button tap];
                          return YES;
                        }];
  [self expectationForPredicate:[NSPredicate predicateWithFormat:@"exists = 1"]
            evaluatedWithObject:app.staticTexts[@"Hello world"]
                        handler:nil];
  [self waitForExpectationsWithTimeout:10 handler:nil];
}

@end
