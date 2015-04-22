//
//  NViewController.m
//  NAsync
//
//  Created by Naithar on 04/18/2015.
//  Copyright (c) 2014 Naithar. All rights reserved.
//

#import "NViewController.h"
@import NAsync;

@interface NViewController ()

@end

@implementation NViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NAsyncManager *queuePromiseManager = [NAsyncManager promiseQueue:nil block:^(NAsyncOperation *operation, id value) {
        NSLog(@"promise queue");
    }];

    @autoreleasepool {
    NAsyncOperation *operation = [[NAsyncOperation alloc] initWithDelay:0
                                                               priority:NSOperationQueuePriorityNormal previousOperation:nil
                                                               andReturnBlock:^(NAsyncOperation *operation, id value) {
                                                                   NSLog(@"value = %@", value);
                                                                   for (int i = 0; i < 100; i++) {
                                                                       NSLog(@"%d", i);
                                                                   }

                                                                   return @90;
                                                               }];

    [operation performOnQueue:[[NSOperationQueue alloc] init] withValue:@101];

    NSLog(@"result = %@", [operation wait]);
    }


    @autoreleasepool {
    NAsyncManager *asyncManager = [[NAsyncManager alloc] initWithQueue:nil withDelay:0 priority:NSOperationQueuePriorityNormal previousOperation:nil andReturnBlock:^id(NAsyncOperation *operation, id value) {
        NSLog(@"value 2 = %@", value);
        return @10;
    }];


    NSLog(@"result 2 = %@", [[asyncManager performWithValue:@50] wait]);
    }

    @autoreleasepool {
    [NAsyncManager queue:nil block:^(NAsyncOperation *operation, id value) {
        NSLog(@"queue");
    }];
    }

    [queuePromiseManager queue:nil block:^(NAsyncOperation *operation, id value) {
        NSLog(@"chained from promise");
    }];

    NAsyncManager *manager = [queuePromiseManager promiseQueue:nil block:^(NAsyncOperation *operation, id value) {
        NSLog(@"chained prmise from promise");
    }];


    [manager perform];

    [[NAsyncManager main:^(NAsyncOperation *operation, id value) {
        self.view.backgroundColor = [UIColor redColor];
    }] main:^(NAsyncOperation *operation, id value) {
        self.view.backgroundColor = [UIColor greenColor];
    } withDelay:10];


    [NAsyncManager main:^(NAsyncOperation *operation, id value) {
        self.view.backgroundColor = [UIColor grayColor];
    } withDelay:5];

    [queuePromiseManager main:^(NAsyncOperation *operation, id value) {
        self.view.backgroundColor = [UIColor blueColor];
    }];

    [queuePromiseManager perform];
    [queuePromiseManager perform];


    [[NAsyncManager queue:nil returnBlock:^id(NAsyncOperation *operation, id value) {
        return [UIColor redColor];
    }] main:^(NAsyncOperation *operation, UIColor *value) {
        self.view.backgroundColor = value;
    } withDelay:15];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
