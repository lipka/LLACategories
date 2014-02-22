//
//  UIImage+LLAAdditions.h
//  LLACategories
//
//  Created by Lukas Lipka on 22/02/14.
//  Copyright (c) 2014 Lukas Lipka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LLAAdditions)

+ (instancetype)lla_imageWithFont:(UIFont *)font named:(NSString *)iconNamed maskColor:(UIColor *)maskColor;

+ (UIImage *)lla_imageNamed:(NSString *)name maskColor:(UIColor *)maskColor;

- (UIImage *)lla_maskWithColor:(UIColor *)maskColor;

@end
