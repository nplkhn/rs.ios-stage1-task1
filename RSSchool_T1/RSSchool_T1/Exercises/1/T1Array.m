#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (sadArray.count < 3){
        return sadArray;
    }
    NSMutableArray* happyArray = [NSMutableArray arrayWithArray:sadArray];
    for (NSUInteger i = 1; i < happyArray.count - 1; i++) {
        NSNumber* intNumber = happyArray[i-1];
        int left = [intNumber intValue];
        intNumber = happyArray[i+1];
        int right = [intNumber intValue];
        intNumber = happyArray[i];
        int mid = [intNumber intValue];
        if (left + right < mid) {
            [happyArray removeObjectAtIndex:i];
            i = 1;
        }
    }
    
    return happyArray;
}

@end
