#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableString* newString = [NSMutableString stringWithString:string];
    NSMutableArray* substrings = [NSMutableArray new];
    NSError *error = nil;
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:@"(<.*?>)|(\\[.*?\\])|(\\(.*?\\))"
                                                                            options:NSRegularExpressionCaseInsensitive
                                                                              error:&error];
    NSArray* matches = [regexp matchesInString:newString
                                       options:0
                                         range:NSMakeRange(0, string.length)];
    for (NSTextCheckingResult *matchResult in matches) {
        NSString* match = [newString substringWithRange:matchResult.range];
        match = [match substringWithRange:NSMakeRange(1, match.length - 2)];
        [substrings addObject:match];
    }
    
    
    
    return substrings;
}

@end

