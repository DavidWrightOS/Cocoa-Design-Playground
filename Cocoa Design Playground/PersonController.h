//
//  PersonController.h
//  Cocoa Design Playground
//
//  Created by David Wright on 6/10/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PersonControllerDelegate;
@class Person;

@interface PersonController : NSObject

// static let shared = PersonController()
+ (instancetype)sharedPersonController;
//@property (nonatomic, class, readonly) PersonController *sharedPersonController;

@property (nonatomic, weak) id<PersonControllerDelegate> delegate;

@end

@protocol PersonControllerDelegate <NSObject>

@required // implicit
@optional
- (void)personController:(PersonController *)aPersonController didObserveNewBirth:(Person *)person;

@end

NS_ASSUME_NONNULL_END
