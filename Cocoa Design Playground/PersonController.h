//
//  PersonController.h
//  Cocoa Design Playground
//
//  Created by David Wright on 6/10/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonController : NSObject

// static let shared = PersonController()
+ (instancetype)sharedPersonController;
//@property (nonatomic, class, readonly) PersonController *sharedPersonController;

@end

NS_ASSUME_NONNULL_END
