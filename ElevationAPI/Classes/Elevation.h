//
//  Elevation.h
//  ElevationAPI
//
//  Created by Patrick BODET on 27/02/2017.
//  Copyright © 2017 iDevelopper. All rights reserved.
//

/**    Special Mention:
 
        A Special Thank to Frank for his great API
 
        frank@marmotte.industries
 
        see http://elevationapi.xyz for documentation
 
        see https://github.com/iDevelopper/ElevationAPI
*/

#import <Foundation/Foundation.h>

@interface Elevation : NSObject

/**
 *  Class initialization.
 *
 *  @param baseURL          Optional (default is @"http://elevationapi.xyz/api").
 *  @param apiVersion       Optional (default is @"v1").
 */
- (nullable instancetype)initWithBaseUrl:(NSString * _Nullable)baseURL andApiVersion:(NSString * _Nullable)apiVersion;

/**
 *  Get the elevation of a point.
 *
 *  @param point                An array of one point @[lat, lon] or a dictionary @{"lat":..., "lon":...}.
 *  @param completionHandler    The completion handler to call when the load request is complete.
 *                              This completion handler takes the following parameters:
 *
 *                              result: elevation in the same type as the input (point)
 *                              error:  An error object that indicates why the request failed, or nil if the request was successful.
 */
- (void)getElevation:(id _Nonnull)point completionHandler:(nullable void (^)(id _Nullable result, NSError * _Nullable error))completionHandler;

/**
 *  Get the elevation of a set of points.
 *
 *  @param points               An array of points @[@[lat, lon], @[lat, lon], ...] or an array of dictionaries @[{"lat":..., "lon":...}, {"lat":..., "lon":...}, ...].
 *  @param completionHandler    The completion handler to call when the load request is complete.
 *                              This completion handler takes the following parameters:
 *
 *                              result: elevations in the same type as the input (points)
 *                              error:  An error object that indicates why the request failed, or nil if the request was successful.
 */
- (void)getElevations:(NSArray * _Nonnull)points completionHandler:(nullable void (^)(id _Nullable result, NSError * _Nullable error))completionHandler;

@end
