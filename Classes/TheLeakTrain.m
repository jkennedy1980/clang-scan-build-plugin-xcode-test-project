//
//  TheLeakTrain.m
//  Test
//
//  Created by Josh Kennedy on 2/16/11.
//  Copyright 2011 JoshKennedy. All rights reserved.
//

/**
 * PURPOSELY LEAKING STUFF TO MAKE SURE CLANG FINDS PROBLEMS
 */
#import "TheLeakTrain.h"

@implementation TheLeakTrain

-(void) shiboobidy{
 
    NSDate *d = [[NSDate alloc] init];
    [d retain];
    [d retain];
    [d retain];
    [d retain];
    [d retain];
    [d retain];

    // NOW WITH MORE COPIED CODE FOR CPD TO FIND!!!
    NSArray * items = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", @"five", @"six", nil];
    NSMutableString *output = [NSMutableString string];
    for( NSString* item in items ){
        if( [item length] > 3 ){
            [output appendFormat:@"%@<--->",item];
        }else{
            [output appendFormat:@"%@<->",item];
        }
    }
    NSLog(@"HERE IS A WEIRD STRING: %@", output );
}

-(void) shiboobidyPartDuex{
    NSDate *d = [[NSDate alloc] init];
    [d retain];
    [d retain];
    [d retain];
    [d retain];
    [d retain];
    [d retain];
    
    
    // NOW WITH MORE COPIED CODE FOR CPD TO FIND!!!
    NSArray * items = [NSArray arrayWithObjects:@"one", @"two", @"three", @"four", @"five", @"six", nil];
    NSMutableString *output = [NSMutableString string];
    for( NSString* item in items ){
        if( [item length] > 3 ){
            [output appendFormat:@"%@<--->",item];
        }else{
            [output appendFormat:@"%@<->",item];
        }
    }
    NSLog(@"HERE IS A WEIRD STRING: %@", output );
}

@end
