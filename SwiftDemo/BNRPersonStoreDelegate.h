//
//  BNRPersonStoreDelegate.h
//  SwiftDemo
//
//  Created by Matthew D. Mathias on 6/9/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//
@class BNRPersonStore;

@protocol BNRPersonStoreDelegate <NSObject>

- (void)didAddPersonToPersonStore:(BNRPersonStore *)personStore;

@end