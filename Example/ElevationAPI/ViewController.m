//
//  ViewController.m
//  ElevationAPI
//
//  Created by Patrick BODET on 26/02/2017.
//  Copyright © 2017 iDevelopper. All rights reserved.
//

#import "ViewController.h"
#import "Elevation.h"

@interface ViewController ()

@property (nonatomic) Elevation *elevation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.elevation = [[Elevation alloc] initWithBaseUrl:nil andApiVersion:nil];
}
- (IBAction)test:(UIButton *)sender
{
    NSArray *array = @[@[@44.582352, @6.695185],
                       @[@44.582879, @6.696953],
                       @[@44.584711, @6.697369],
                       @[@44.585488, @6.697193],
                       @[@44.587027, @6.695611]
                       ];

    [_elevation getElevations:array completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result = %@", result);
    }];
    
    NSMutableArray *arrayOfDicts = [[NSMutableArray alloc] init];
    
    for (NSArray *point in array) {
        NSDictionary *dict = @{
                               @"lat" : point[0],
                               @"lon" : point[1]
                               };
        [arrayOfDicts addObject:dict];
    }
    
    [_elevation getElevations:arrayOfDicts completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result = %@", result);
    }];
    
    [_elevation getElevation:array[0] completionHandler:^(id  _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result = %@", result);
    }];
    
    [_elevation getElevation:arrayOfDicts[0] completionHandler:^(id  _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result = %@", result);
    }];
    
    NSMutableArray *bigArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 2000; i++) {
        [bigArray addObjectsFromArray:array];
    }
    
    [_elevation getElevations:bigArray completionHandler:^(NSArray * _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result count = %lu", result.count);
    }];
}

@end
