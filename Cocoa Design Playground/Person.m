//
//  Person.m
//  Cocoa Design Playground
//
//  Created by David Wright on 6/10/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    return [self initWithName:@"Bob" birthDate:NSDate.date hairColor:PersonHairColorBrown];
}

- (instancetype)initWithName:(NSString *)aName birthDate:(NSDate *)aBirthDate hairColor:(PersonHairColor)aHairColor
{
    if (self = [super init]) {
        _fullName = aName.copy;
        _birthDate = aBirthDate;
        _hairColor = aHairColor;
    }
    return self;
}

- (NSString *)description
{
    static NSDictionary<NSNumber *, NSString *> *hairLookup = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hairLookup = @{
            @(PersonHairColorBrown): @"Brown",
            @(PersonHairColorBlonde): @"Blonde",
            @(PersonHairColorOrange): @"Orange",
            @(PersonHairColorBlue): @"Blue",
            @(PersonHairColorTeal): @"Teal",
        };
    });
    
    NSString *hairColorString = [hairLookup objectForKey:@(self.hairColor)];
    
    return [NSString stringWithFormat:@"<%@: %p: %@, born on %@, with hair color: %@>",
            NSStringFromClass(self.class), self, self.fullName, self.birthDate, hairColorString];
}

@end
