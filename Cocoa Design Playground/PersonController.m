//
//  PersonController.m
//  Cocoa Design Playground
//
//  Created by David Wright on 6/10/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "PersonController.h"
#import "Person.h"

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
        
        [NSTimer scheduledTimerWithTimeInterval:5
                                         target:self
                                       selector:@selector(recordNewBirth:)
                                       userInfo:nil
                                        repeats:YES];
    }
    
    return self;
}

- (void)recordNewBirth:(id)sender
{
//    if ([self.delegate isKindOfClass:NSString.class]) { // check if the delegate is of type NSString, or one of its subclasses
//    if ([self.delegate isMemberOfClass:NSString.class]) {} // check if the delegate is of type NSString (this method sucks)

//    if ([self.delegate conformsToProtocol:@protocol(PersonControllerDelegate)]) { // this method sucks
    
    // make sure the delegate implements the method we are interested in before actually calling the method
    if ([self.delegate respondsToSelector:@selector(personController:didObserveNewBirth:)]) {
        Person *person = [[Person alloc] initWithName:[self generateRandomName] birthDate:NSDate.now hairColor:arc4random_uniform(5)];
        
        [self.delegate personController:self didObserveNewBirth:person];
    }
}

- (NSString *)generateRandomName
{
    static NSArray *firstNames = nil;
    static NSArray *lastNames = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        firstNames = @[@"Dimitri", @"Alex", @"David", @"Jessie", @"Chad"];
        lastNames = @[@"Bouniol", @"Thompson", @"Chad"];
    });
    
    NSUInteger randomIndex = arc4random_uniform((uint32_t)firstNames.count);
    NSString *randomFirstName = [firstNames objectAtIndex:randomIndex];
    NSString *randomLastName = [lastNames objectAtIndex:arc4random_uniform((uint32_t)lastNames.count)];
    
    return [NSString stringWithFormat:@"%@ %@", randomFirstName, randomLastName];
    
}

@end
