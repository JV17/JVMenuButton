//
//  JVMenuButton.h
//  Pods
//
//  Created by Jorge Valbuena on 2015-04-27.
//
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@import CoreGraphics;
@import QuartzCore;

@interface JVMenuButton : UIButton

#pragma mark - Properties

@property (nonatomic, strong) UIColor *color;
@property (nonatomic) BOOL showButton;
@property (nonatomic) CGFloat lineWidth;

#pragma mark - Initializers

/**
 *  Creates a JVMenuButton with frame, button color, button line width and initialize all dependencies of the button
 *
 *  @param frame
        A CGRect which specifies the button frame
 *  @param color
        A UIColor which specifies the button color
 *  @param lineWidth
        A CGFloat which specifies the button line width
 *
 *  @return a JVMenuButton
 */
- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color lineWidth:(CGFloat)lineWidth;


/**
 *  Creates a JVMenuButton with no frame, standard color and line width. Also, initialize all dependencies of the button
 *
 *  @return a JVMenuButton
 */
- (instancetype)init;


/**
 *  Creates a JVMenuButton with frame, standard color and line width. Also, initialize all dependencies of the button
 *
 *  @param frame
        A CGRect which specifies the button frame
 *
 *  @return a JVMenuButton
 */
- (instancetype)initWithFrame:(CGRect)frame;


/**
 *  Throws an exception to indicate the use of `initWithFrame:(CGRect)frame` method instead
 *
 *  @return exception
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder;

@end
