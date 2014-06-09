//
//  BNRPerson.h
//  SwiftDemo
//
//  Created by Matthew D. Mathias on 6/8/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSUInteger age;

- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age;

@end
