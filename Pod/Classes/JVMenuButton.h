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

@property (nonatomic) BOOL showButton;


#pragma mark - Initializers

/**
 *  Creates a JVMenuButton with no frame and initialize all dependencies of the button
 *
 *  @param n/a
 *
 *  @return a JVMenuButton
 */
- (instancetype)init;


/**
 *  Creates a JVMenuButton with frame and initialize all dependencies of the button
 *
 *  @param a CGRect which specifies the button frame
 *
 *  @return a JVMenuButton
 */
- (instancetype)initWithFrame:(CGRect)frame;


/**
 *  Throws an exception to indicate the use of `initWithFrame:(CGRect)frame` method instead
 *
 *  @param n/a
 *
 *  @return exception
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder;

@end