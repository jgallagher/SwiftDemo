//
//  BNRPersonStore.m
//  SwiftDemo
//
//  Created by Matthew D. Mathias on 6/8/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

#import "BNRPersonStore.h"
#import "BNRPerson.h"

@interface BNRPersonStore ()

@property (nonatomic) NSMutableArray *mutablePersons;

@end

@implementation BNRPersonStore

- (instancetype)initWithPersons:(NSArray *)persons
{
    self = [super init];
    if (self) {
        _mutablePersons = [NSMutableArray arrayWithArray:persons];
    }
    return self;
}

- (NSArray *)allPersons
{
    return [self.mutablePersons copy];
}

- (void)addPerson:(BNRPerson *)person
{
    [self.mutablePersons addObject:person];
    [self.delegate didAddPersonToPersonStore:self];
}

- (void)removePerson:(BNRPerson *)person
{
    [self.mutablePersons removeObject:person];
}

@end
