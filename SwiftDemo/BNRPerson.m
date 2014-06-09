//
//  BNRPerson.m
//  SwiftDemo
//
//  Created by Matthew D. Mathias on 6/8/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

@end
