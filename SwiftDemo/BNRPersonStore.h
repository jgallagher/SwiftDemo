//
//  BNRPersonStore.h
//  SwiftDemo
//
//  Created by Matthew D. Mathias on 6/8/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPersonStoreDelegate.h"
@class BNRPerson;

@interface BNRPersonStore : NSObject

@property (nonatomic, copy, readonly) NSArray *allPersons;
@property (nonatomic, weak) id<BNRPersonStoreDelegate> delegate;

- (instancetype)initWithPersons:(NSArray *)persons;
- (void)addPerson:(BNRPerson *)person;
- (void)removePerson:(BNRPerson *)person;

@end
