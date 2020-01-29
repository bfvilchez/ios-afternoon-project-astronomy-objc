//
//  Rover.m
//  Astronomy
//
//  Created by brian vilchez on 1/27/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "Rover.h"

@implementation Rover

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSString *image = dictionary[@"img_src"];
    NSString *name = dictionary[@"rover"][@"name"];
    NSString *status = dictionary[@"rover"][@"status"];
   int totalPhotos = [dictionary[@"rover"][@"total_photos"] intValue];
    return [self initWithName:name status:status totalPhotos: totalPhotos image:image] ;
    
}

- (instancetype)initWithName:(NSString *)name status:(NSString *)status totalPhotos:(int )totalPhotos image:(nonnull NSString *)image {
        self = [super init];
    if (self != nil) {
        _name = name;
        _statis = status;
        _totalPhotos = totalPhotos;
        _image = image;
    }
    return self;
}

@end
