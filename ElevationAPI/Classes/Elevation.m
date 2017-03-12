//
//  Elevation.m
//  ElevationAPI
//
//  Created by Patrick BODET on 27/02/2017.
//  Copyright © 2017 iDevelopper. All rights reserved.
//

#import "Elevation.h"

@interface Elevation ()

@property (nonatomic) NSString *baseURL;
@property (nonatomic) NSString *apiVersion;

@property (nonatomic) NSURLSession *session;

@end

@implementation Elevation

- (instancetype)initWithBaseUrl:(NSString *)baseURL andApiVersion:(NSString *)apiVersion
{
    if (!(self = [super init])) {
        return nil;
    }
    self.baseURL =      @"http://elevationapi.xyz/api";
    self.apiVersion =   @"v1";
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:configuration];
    
    return self;
}

- (void)getElevation:(NSArray *)point completionHandler:(void (^)(id result, NSError *error))completionHandler
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:point options:0 error:&error];
    
    if (!jsonData) {
        completionHandler(jsonData, error);
        return;
    }
    
    NSString *payload = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/point?point=%@", _baseURL, _apiVersion, payload];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSError *error = nil;
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            completionHandler(result, error);
        }
        else {
            completionHandler(data, error);
        }
        
    }];
    
    [task resume];
}

- (void)getElevations:(NSArray *)points completionHandler:(void (^)(id result, NSError *error))completionHandler
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:points options:0 error:&error];
    
    if (!jsonData) {
        completionHandler(jsonData, error);
        return;
    }

    NSString *pointsString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    NSDictionary *dict = @{@"points": pointsString};
    
    jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    
    if (!jsonData) {
        completionHandler(jsonData, error);
        return;
    }

    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]];
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/points", _baseURL, _apiVersion];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSError *error = nil;
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            completionHandler(result, error);
        }
        else {
            completionHandler(data, error);
        }
        
    }];
    
    [task resume];
}

@end
