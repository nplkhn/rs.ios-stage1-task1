#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int total_cost = 0;
    for (NSUInteger i = 0; i < bill.count; i++)
    {
        if (i != index){
            NSNumber* cost = bill[i];
            total_cost += [cost intValue];
        }
    }
    total_cost /= 2;
    if (total_cost == [sum intValue])
    {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%d", [sum intValue] - total_cost];
    }
    
    return @"";
}

@end
