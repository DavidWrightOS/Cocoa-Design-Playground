//
//  PersonController.m
//  Cocoa Design Playground
//
//  Created by David Wright on 6/10/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "PersonController.h"

@implementation PersonController

+ (instancetype)sharedPersonController
{
    static PersonController *personController = nil; // global, but only accessible in this method
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        personController = [[PersonController alloc] initSharedInstance];
        
        // configure your person controller
    });
    
//    if (!personController) {
//        personController = [[PersonController alloc] init];
//
//        // configure your person controller here
//    }
    
    return personController;
}

- (instancetype)initSharedInstance
{
    if (self = [super init]) {
        // you can also configure your person controller here
    }
    
    return self;
}

@end
