//
//  RoverController.m
//  Astronomy
//
//  Created by brian vilchez on 1/27/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "RoverController.h"
#import "Rover.h"

NSString *apiKey =  @"mAwpwNEjGFWWKDohgh03Plsuu1a8HgxRlMRmvlHL";
NSString *baseURL = @"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos";
// https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY

@interface RoverController()

@property(nonatomic) NSMutableArray<Rover *> *internalRovers;

@end

@implementation RoverController

//MARK: - initializers
- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalRovers = [[NSMutableArray alloc] init];
    }
    return self;
}

//MARK: - properties
- (NSArray *)rovers {
    return [self.internalRovers copy];
}


- (void)fetchRoverCompletion:(void (^)(NSError * _Nullable))completion {
    NSURL *marsRoverURL = [NSURL URLWithString: baseURL];
    NSURLComponents *components = [NSURLComponents componentsWithURL:marsRoverURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *sol = [NSURLQueryItem queryItemWithName:@"sol" value:@"10"];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName: @"api_key" value: apiKey];
    
    components.queryItems = @[sol, apiKeyItem];
    NSLog(@"%@", components.URL);
    
    NSMutableURLRequest *requestURl = [NSMutableURLRequest requestWithURL:components.URL];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession]dataTaskWithRequest:requestURl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error getting data: %@", error);
            completion(error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(jsonError);
            return;
        }
        
        if(![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"json was not a dictionary as expected");
            completion([[NSError alloc] init]);
            return;
        }
        
        NSArray *photos = jsonDictionary[@"photos"];
        NSMutableArray *fetchedPhotos = [[NSMutableArray alloc] init];
    
        for (NSDictionary *roverDictionary in photos) {
            Rover *rover = [[Rover alloc] initWithDictionary: roverDictionary];
            [fetchedPhotos addObject:rover];
        }
        
        [[self internalRovers] addObjectsFromArray:fetchedPhotos];
        completion(nil);
    }];
    
    [dataTask resume];
    
    
}

- (void)fetchImage:(NSString *)image WithCompletion:(void (^)(NSError *, UIImage *))completion {
    
    NSURL *photoURL = [NSURL URLWithString:image];
    NSURLRequest *request = [NSURLRequest requestWithURL:photoURL];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"faield to fetch json %@", error);
            completion(error,nil);
            return;
        }
        
        
        
    }];
    [dataTask resume];
}

@end
