#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray* substrings = [NSMutableArray new];
    NSError *error = nil;
    NSRegularExpression *regex1 = [NSRegularExpression regularExpressionWithPattern:@"(<.*?>)|(\\(.*?\\))|(\\[.*?\\])"
                                                                            options:NSRegularExpressionCaseInsensitive
                                                                              error:&error];

    NSArray* matches = [regex1 matchesInString:string
                                       options:0
                                         range:NSMakeRange(0, string.length)];
    for (NSTextCheckingResult *matchResult in matches) {
        NSString* match = [string substringWithRange:matchResult.range];
        match = [match substringWithRange:NSMakeRange(1, match.length - 2)];
        [substrings addObject:match];
    }
    
    for (NSUInteger i = 0; i < substrings.count; i++) {
        NSArray<NSString*>* subs = [NSArray arrayWithArray:[[Parser new] parseString:substrings[i]]];
        for (NSString* sub in subs) {
            if (![substrings containsObject:sub]) {
                [substrings addObject:sub];
            }
        }
    }
    
    
    return substrings;
}

@end

