# ElevationAPI

[![CI Status](http://img.shields.io/travis/iDevelopper/ElevationAPI.svg?style=flat)](https://travis-ci.org/iDevelopper/ElevationAPI)
[![Version](https://img.shields.io/cocoapods/v/ElevationAPI.svg?style=flat)](http://cocoapods.org/pods/ElevationAPI)
[![License](https://img.shields.io/cocoapods/l/ElevationAPI.svg?style=flat)](http://cocoapods.org/pods/ElevationAPI)
[![Platform](https://img.shields.io/cocoapods/p/ElevationAPI.svg?style=flat)](http://cocoapods.org/pods/ElevationAPI)

Get the elevation of (almost) any point on Earth

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

You can also run `pod try ElevationAPI` in your Terminal from anywhere.

## Installation

The easiest way to install it is by copying the following to your project:

* Elevation.h
* Elevation.m

ElevationAPI is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ElevationAPI"
```

## Features

ElevationAPI is a simple class that interfaces with http://www.elevationapi.xyz . It permits you to get the elevation of almost any point on Earth.

## Usage - Examples

* Initialize an instance of a Elevation Class:

```objective-c
Elevation *elevation = [[Elevation alloc] initWithBaseUrl:nil andApiVersion:nil];
```
By default:

baseURL = "http://elevationapi.xyz/api" and apiVersion = "v1"

* Get the elevation of a point:

```objective-c
NSArray *array = @[@44.582352, @6.695185];

[elevation getElevation:array completionHandler:^(id  _Nullable result, NSError * _Nullable error) {
NSLog(@"Result = %@", result);
}];
```
* Get the elevation of a set of points:

```objective-c
NSArray *array = @[@[@44.582352, @6.695185],
@[@44.582879, @6.696953],
@[@44.584711, @6.697369],
@[@44.585488, @6.697193],
@[@44.587027, @6.695611]
];

[elevation getElevations:array completionHandler:^(id _Nullable result, NSError * _Nullable error) {
NSLog(@"Result = %@", result);
}];
```
* This can be done with Array of Dictionaries too:

See Elevation.h where methods are documented and ViewController.m where examples are provided.

## Requirements

* iOS 9.0 or later.
* ARC memory management.

## Special Mention

A Special Thank to [Frank](http://elevationapi.xyz) For this great API.

Documentation [here](http://elevationapi.xyz).

## Author

iDevelopper, patrick.bodet4@wanadoo.fr

## License

ElevationAPI is available under the MIT license. See the LICENSE file for more info.
