#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    // Step 1. Decomposed the string into characters
    NSMutableArray* stringArray = [NSMutableArray new];
    for (NSUInteger i = 0; i < s.length; i++) {
        [stringArray addObject:[s substringWithRange:NSMakeRange(i, 1)]];
    }
    
    // Step2. Check if the opposite elements are the same and counter (counts number of replace operations) less than k
    int counter = 0;
    for (NSUInteger i = 0; i < ceil(stringArray.count/2); i++) {
        if (![stringArray[i] isEqual:stringArray[stringArray.count - 1 - i]]) {
            int leftNumber = [stringArray[i] intValue];
            int rightNumber = [stringArray[stringArray.count - 1 - i] intValue];
            if (leftNumber > rightNumber) {
                [stringArray replaceObjectAtIndex:stringArray.count - 1 - i withObject:stringArray[i]];
            } else {
                [stringArray replaceObjectAtIndex:i withObject:stringArray[stringArray.count - 1 - i]];
            }
            counter++;
        }
        if (counter > [k intValue]) {
            return @"-1";
        }
    }
    
    // Step 3. Check if we have additional replaces.
    int additional_replacements = [k intValue] - counter;
    int idx = 0;
    while (additional_replacements) {
        stringArray[idx] = stringArray[stringArray.count - idx - 1] = @"9";
        idx++;
        additional_replacements--;
    }
    
    // Step 5. Get the string from the converted array and return it.
    NSMutableString* palindrome = [NSMutableString new];
    for (NSUInteger i = 0; i < stringArray.count; i++) {
        [palindrome appendString:stringArray[i]];
    }
    
    return palindrome;
}

@end
