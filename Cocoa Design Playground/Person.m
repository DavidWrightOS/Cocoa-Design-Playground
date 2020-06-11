//
//  Person.m
//  Cocoa Design Playground
//
//  Created by David Wright on 6/10/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "Person.h"

@interface Person (){
    BOOL _hasBirthMark;
}
@end

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
        
        _hasBirthMark = arc4random_uniform(2) == 0 ? NO : YES;
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

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    Person *copy = [[Person alloc] init];
    copy.fullName = self.fullName;
    copy.birthDate = self.birthDate;
    copy.hairColor = self.hairColor;
    
    return copy;
}

- (BOOL)isEqual:(Person *)object
{
    if (![object isKindOfClass:Person.class]) return NO;
    if (self == object) return YES;
    
    return [self.fullName isEqualToString:object.fullName]
    && [self.birthDate isEqualToDate:object.birthDate]
    && self.hairColor == object.hairColor
    && _hasBirthMark == object->_hasBirthMark;
}

- (NSUInteger)hash
{
    return self.fullName.hash ^ self.birthDate.hash ^ @(self.hairColor).hash ^ @(_hasBirthMark).hash;
}

@end
