//
//  JVButtonHelper.h
//  Pods
//
//  Created by Jorge Valbuena on 2015-04-28.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JVButtonHelper : NSObject

+ (void)removeLayerFromView:(UIView *)view;

+ (void)setGradientBackgroundInView:(UIView *)view withFirstHexColor:(NSString *)firstHexColor andSecondHexColor:(NSString *)secondHexColor;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIColor *)colorWithRGBHex:(UInt32)hex;

@end