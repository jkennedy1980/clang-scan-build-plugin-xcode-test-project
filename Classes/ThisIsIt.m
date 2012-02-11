//
//  ThisIsIt.m
//  Test
//
//  Created by Josh Kennedy on 2/11/11.
//  Copyright 2011 JoshKennedy. All rights reserved.
//

#import "ThisIsIt.h"


@implementation ThisIsIt

@synthesize it;

- (void) doIt{
    
    NSDate *d = [[NSDate alloc] init];
    [d retain];
    
    NSLog( @"%@", [it retain] );
}

@end
