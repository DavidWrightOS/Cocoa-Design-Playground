//
//  ViewController.m
//  Cocoa Design Playground
//
//  Created by David Wright on 6/10/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "ViewController.h"
#import "PersonController.h"

@interface ViewController () <PersonControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    PersonController *sharedController = [PersonController sharedPersonController];
    PersonController *sharedControllerA = PersonController.sharedPersonController;
    NSLog(@"Person Controller A: %@", sharedControllerA);
    
    PersonController *sharedControllerB = PersonController.sharedPersonController;
    NSLog(@"Person Controller B: %@", sharedControllerB);
    
    PersonController.sharedPersonController.delegate = self;
}

- (void)personController:(PersonController *)aPersonController didObserveNewBirth:(id)person
{
    if ([person isKindOfClass:NSString.class]) {
        // We know this is a string!
    }
    
    NSLog(@"New birth! %@", person);
}


@end
