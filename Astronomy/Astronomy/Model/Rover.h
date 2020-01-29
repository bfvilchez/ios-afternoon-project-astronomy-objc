//
//  Rover.h
//  Astronomy
//
//  Created by brian vilchez on 1/27/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rover : NSObject
@property(nonnull, nonatomic) NSString *name;
@property(nonnull,nonatomic) NSString *image;
@property(nonnull, nonatomic) NSString *statis;
@property(nonatomic) int totalPhotos;

- (instancetype)initWithName:(NSString *)name status:(NSString *)status totalPhotos:(int )totalPhotos image:(NSString *)image;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
