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

@property (nonatomic, copy, readwrite) NSArray *allPersons;

@end

@implementation BNRPersonStore

- (instancetype)initWithPersons:(NSArray *)persons
{
    self = [super init];
    if (self) {
        _allPersons = persons;
    }
    return self;
}

- (void)addPerson:(BNRPerson *)person
{
    NSMutableArray *mutablePersons = [NSMutableArray arrayWithArray:self.allPersons];
    [mutablePersons addObject:person];
    self.allPersons = [mutablePersons copy];
    [self.delegate didAddPersonToPersonStore:self];
}

- (void)removePerson:(BNRPerson *)person
{
    NSMutableArray *mutablePersons = [NSMutableArray arrayWithArray:self.allPersons];
    if ([mutablePersons containsObject:person]) {
        [mutablePersons removeObject:person];
    }
    self.allPersons = [mutablePersons copy];
}

@end
