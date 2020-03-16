#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSMutableArray* sortedArray = [NSMutableArray arrayWithArray:array];
    NSMutableArray* result = [NSMutableArray new];
    [sortedArray sortUsingSelector:@selector(compare:)];
    int sum = 0;
    for (NSUInteger i = 0; i < sortedArray.count - 1; i++){
        NSNumber* number = sortedArray[i];
        int value = [number intValue];
        sum += value;
    }
    [result addObject:[NSNumber numberWithInt:sum]];
    sum = 0;
    for (NSUInteger i = 1; i < sortedArray.count; i++){
        NSNumber* number = sortedArray[i];
        int value = [number intValue];
        sum += value;
    }
    [result addObject:[NSNumber numberWithInt:sum]];
    return result;
}

@end


