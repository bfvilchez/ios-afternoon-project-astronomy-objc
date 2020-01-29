//
//  RoverController.h
//  Astronomy
//
//  Created by brian vilchez on 1/27/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class Rover;

@interface RoverController : NSObject

@property(nonatomic,nonnull) NSArray<Rover *> *rovers;
- (void)fetchRoverCompletion:(void(^)(NSError *error))completion;
- (void)fetchImage:(NSString *)image WithCompletion:(void(^)(NSError *error, UIImage *image))completion;
@end

NS_ASSUME_NONNULL_END
