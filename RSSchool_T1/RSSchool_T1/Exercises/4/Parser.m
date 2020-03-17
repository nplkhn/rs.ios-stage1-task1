#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray* substrings = [NSMutableArray new];
    for (NSUInteger i = 0; i < string.length; i++) {
        int counter = 0;
        NSUInteger endPos = 0;
        if ([[string substringWithRange:NSMakeRange(i, 1)] isEqualToString: @"("]) {
            NSString* openingBracket = @"(";
            NSString* closingBracket = @")";
            counter++;
            for (NSUInteger j = i + 1; j < string.length; j++) {
                if ([[string substringWithRange:NSMakeRange(j, 1)] isEqualToString:openingBracket]) {
                    counter++;
                } else if ([[string substringWithRange:NSMakeRange(j, 1)] isEqualToString:closingBracket]) {
                    counter--;
                }
                if (counter == 0) {
                    endPos = j;
                    break;
                }
            }
            [substrings addObject:[string substringWithRange:NSMakeRange(i, endPos - i)]];
        } else if ([[string substringWithRange:NSMakeRange(i, 1)] isEqual: @"["]) {
            NSString* openingBracket = @"[";
            NSString* closingBracket = @"]";
            counter++;
            for (NSUInteger j = i + 1; j < string.length; j++) {
                if ([[string substringWithRange:NSMakeRange(j, 1)] isEqualToString:openingBracket]) {
                    counter++;
                } else if ([[string substringWithRange:NSMakeRange(j, 1)] isEqualToString:closingBracket]) {
                    counter--;
                }
                if (counter == 0) {
                    endPos = j;
                    break;
                }
            }
            [substrings addObject:[string substringWithRange:NSMakeRange(i, endPos - i)]];
            
        } else if ([[string substringWithRange:NSMakeRange(i, 1)] isEqual: @"<"]) {
            NSString* openingBracket = @"<";
            NSString* closingBracket = @">";
            counter++;
            for (NSUInteger j = i + 1; j < string.length; j++) {
                if ([[string substringWithRange:NSMakeRange(j, 1)] isEqualToString:openingBracket]) {
                    counter++;
                } else if ([[string substringWithRange:NSMakeRange(j, 1)] isEqualToString:closingBracket]) {
                    counter--;
                }
                if (counter == 0) {
                    endPos = j;
                    break;
                }
            }
            [substrings addObject:[string substringWithRange:NSMakeRange(i, endPos - i)]];
        }
    }
    
    for (NSUInteger i = 0; i < substrings.count; i++) {
        NSString* temp = substrings[i];
        substrings[i] = [temp substringWithRange:NSMakeRange(1, temp.length - 1)];
    }
    
    
    return substrings;
}

@end

