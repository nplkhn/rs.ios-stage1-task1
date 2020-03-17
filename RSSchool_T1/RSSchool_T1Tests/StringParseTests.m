#import <XCTest/XCTest.h>
#import "Parser.h"

@interface StringParseTests : XCTestCase
@end

@implementation StringParseTests

- (void)testParser1 {
    NSString *inputString = @"It's a <simple> [input] (string)";
    NSArray *expectedArray = @[@"simple", @"input", @"string"];
    XCTAssertEqualObjects([[[Parser alloc] init] parseString:inputString], expectedArray);
}

- (void)testParser2 {
    NSString *inputString = @"It's so special<link>. The numbers(3500) are incredible, so difficult. I said we wanted to write our own stories, create our own history, said Klopp(the boss of Liverpool[English football club]).";
    NSArray *expectedArray = @[@"link", @"3500", @"the boss of Liverpool[English football club]", @"English football club"];
    XCTAssertEqualObjects([[[Parser alloc] init] parseString:inputString], expectedArray);
}

- (void)testParser3 {
    NSString *inputString = @"Lorem <(ipsum [dolor <sit] amet), consectetur adipiscing elit>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet>. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget (nulla. Class aptent <taciti [sociosqu ad] litora torquent per conubia> nostra), per inceptos himenaeos.";
    NSArray *parsedArray = [[[Parser alloc] init] parseString:inputString];
    NSLog(@"%@", parsedArray);
    XCTAssertTrue([parsedArray containsObject:@"(ipsum [dolor <sit] amet), consectetur adipiscing elit>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet"]);
    XCTAssertTrue([parsedArray containsObject:@"ipsum [dolor <sit] amet"]);
    XCTAssertTrue([parsedArray containsObject:@"(ipsum [dolor <sit] amet), consectetur adipiscing elit>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet"]);
    XCTAssertTrue([parsedArray containsObject:@"sit] amet), consectetur adipiscing elit"]);
    XCTAssertTrue([parsedArray containsObject:@"dolor <sit"]);
    XCTAssertTrue([parsedArray containsObject:@"nulla. Class aptent <taciti [sociosqu ad] litora torquent per conubia> nostra"]);
    XCTAssertTrue([parsedArray containsObject:@"taciti [sociosqu ad] litora torquent per conubia"]);
    XCTAssertTrue([parsedArray containsObject:@"sociosqu ad"]);

}
@end
