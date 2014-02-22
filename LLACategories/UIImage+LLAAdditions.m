//
//  UIImage+LLAAdditions.m
//  LLACategories
//
//  Created by Lukas Lipka on 22/02/14.
//  Copyright (c) 2013 David Keegan All rights reserved.
//  Copyright (c) 2014 Lukas Lipka. All rights reserved.
//

#import "UIImage+LLAAdditions.h"
#import <CoreText/CoreText.h>

@implementation UIImage (LLAAdditions)

+ (NSCache *)lla_cache {
    static NSCache *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[NSCache alloc] init];
    });
    return cache;
}

+ (instancetype)lla_imageWithFont:(UIFont *)font named:(NSString *)iconNamed maskColor:(UIColor *)maskColor {
    if (!font) {
        return nil;
    }
    
    NSString *identifier = [NSString stringWithFormat:@"%@%@%@%@%f", NSStringFromSelector(_cmd), font.fontName, maskColor, iconNamed, font.pointSize];
    
    UIImage *image = [[self lla_cache] objectForKey:identifier];
    if (!image) {
        NSMutableAttributedString *ligature = [[NSMutableAttributedString alloc] initWithString:iconNamed];
        [ligature setAttributes:@{(NSString *)kCTLigatureAttributeName: @(2), (NSString *)kCTFontAttributeName: font} range:NSMakeRange(0, ligature.length)];
        
        CGSize imageSize = [ligature size];
        imageSize.width = ceilf(imageSize.width);
        imageSize.height = ceilf(imageSize.height);
        
        if (!CGSizeEqualToSize(CGSizeZero, imageSize)) {
            UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
            [ligature drawAtPoint:CGPointZero];
            image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            if (maskColor) {
                UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
                CGContextRef context = UIGraphicsGetCurrentContext();
                CGContextScaleCTM(context, 1, -1);
                CGContextTranslateCTM(context, 0, -imageSize.height);
                CGContextClipToMask(context, (CGRect){CGPointZero, imageSize}, [image CGImage]);
                [maskColor setFill];
                CGContextFillRect(context, (CGRect){CGPointZero, imageSize});
                image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
            }
            
            [[self lla_cache] setObject:image forKey:identifier];
        }
    }
    
    return image;
}

+ (UIImage *)lla_imageNamed:(NSString *)name maskColor:(UIColor *)maskColor {
    UIImage *image = [UIImage imageNamed:name];
    return [image lla_maskWithColor:maskColor];
}

- (UIImage *)lla_maskWithColor:(UIColor *)maskColor {
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawInRect:rect];
    CGContextSetBlendMode(ctx, kCGBlendModeSourceAtop);
    CGContextSetFillColorWithColor(ctx, [maskColor CGColor]);
    CGContextFillRect(ctx, rect);
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

@end
