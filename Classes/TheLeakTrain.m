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

}

-(void) shiboobidyPartDuex{
    NSDate *d = [[NSDate alloc] init];
    [d retain];
    [d retain];
    [d retain];
    [d retain];
    [d retain];
    [d retain];
}

@end
