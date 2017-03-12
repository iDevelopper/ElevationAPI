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
@property (nonatomic) NSArray *array;
@property (nonatomic) NSMutableArray *arrayOfDicts;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.elevation = [[Elevation alloc] initWithBaseUrl:nil andApiVersion:nil];
}
- (IBAction)test:(UIButton *)sender
{
    self.array = @[@[@44.582352, @6.695185],
                       @[@44.582879, @6.696953],
                       @[@44.584711, @6.697369],
                       @[@44.585488, @6.697193],
                       @[@44.587027, @6.695611]
                       ];

    [_elevation getElevations:_array completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result = %@", result);
        [self test2];
    }];
}

- (void)test2
{
    self.arrayOfDicts = [[NSMutableArray alloc] init];
    
    for (NSArray *point in _array) {
        NSDictionary *dict = @{
                               @"lat" : point[0],
                               @"lon" : point[1]
                               };
        [_arrayOfDicts addObject:dict];
    }
    
    [_elevation getElevations:_arrayOfDicts completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result = %@", result);
        [self test3];
    }];
}

- (void)test3
{
    [_elevation getElevation:_array[0] completionHandler:^(id  _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result = %@", result);
        [self test4];
    }];
}

- (void)test4
{
    [_elevation getElevation:_arrayOfDicts[0] completionHandler:^(id  _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result = %@", result);
        [self test5];
    }];
}

- (void)test5
{
    NSMutableArray *bigArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 2000; i++) {
        [bigArray addObjectsFromArray:_array];
    }
    
    [_elevation getElevations:bigArray completionHandler:^(NSArray * _Nullable result, NSError * _Nullable error) {
        NSLog(@"Result count = %lu", result.count);
    }];
}

@end
