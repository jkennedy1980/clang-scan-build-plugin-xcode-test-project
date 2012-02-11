#import "GHUnit.h"
#import "OCMock.h"
#import "OCMockObject.h"
#import "ThisReturnsInts.h"

@interface JustATest : GHTestCase {}



@end

@implementation JustATest

// NSOrderedAscending - left is smaller than right
// NSOrderedDescending - right is smaller than left
NSComparisonResult compare( id<ThisReturnsInts> left, id<ThisReturnsInts> right, void *context) {
    int leftValue = [left getInt];
    int rightValue = [right getInt];

    if( leftValue < rightValue ) return NSOrderedAscending;
    if( leftValue > rightValue ) return NSOrderedDescending;
    return NSOrderedSame;
}

- (void) testFirstUT {

    id mock1 = [OCMockObject mockForProtocol:@protocol(ThisReturnsInts)];
    int expected1 = 1;
    [[[mock1 stub] andReturnValue:OCMOCK_VALUE(expected1)] getInt];
    
    id mock2 = [OCMockObject mockForProtocol:@protocol(ThisReturnsInts)];
    int expected2 = 2;
    [[[mock2 stub] andReturnValue:OCMOCK_VALUE(expected2)] getInt];
    
    id mock3 = [OCMockObject mockForProtocol:@protocol(ThisReturnsInts)];
    int expected3 = 3;
    [[[mock3 stub] andReturnValue:OCMOCK_VALUE(expected3)] getInt];
    
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    [array addObject:mock2];
    [array addObject:mock3];
    [array addObject:mock1];
    
    [array sortUsingFunction:compare context:NULL];

    GHAssertEquals( [[array objectAtIndex:0] getInt], expected1, @"BAD" );
    GHAssertEquals( [[array objectAtIndex:1] getInt], expected2, @"BAD" );
    GHAssertEquals( [[array objectAtIndex:2] getInt], expected3, @"BAD" );

    // More purposeful leaking
    NSString *someString0 = [[[NSString alloc] init] retain];
    NSString *someString1 = [[NSString alloc] init];
    NSString *someString2 = [[NSString alloc] init];
    
    [mock1 verify];
    [mock2 verify];
    [mock3 verify];
}
     


@end