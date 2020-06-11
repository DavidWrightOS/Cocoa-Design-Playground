//
//  Person.h
//  Cocoa Design Playground
//
//  Created by David Wright on 6/10/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PersonHairColor) {
    PersonHairColorBrown = 0,
    PersonHairColorBlonde = 1,
    PersonHairColorOrange = 2,
    PersonHairColorBlue = 3,
    PersonHairColorTeal = 4,
};

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *fullName;
@property (nonatomic) NSDate *birthDate;
@property (nonatomic) PersonHairColor hairColor; // Enumerations are a C type, so they are not initialized as a pointer *

- (instancetype)initWithName:(NSString *)aName birthDate:(NSDate *)aBirthDate hairColor:(PersonHairColor)hairColor;

@end

NS_ASSUME_NONNULL_END
