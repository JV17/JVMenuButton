//
//  JVMenuButton.m
//  Pods
//
//  Created by Jorge Valbuena on 2015-04-27.
//
//

#import "JVMenuButton.h"
#import "CAShapeLayer+Animations.h"

#define MENU_STROKE_START 0.325
#define MENU_STROKE_END 0.91
#define BUTTON_STROKE_START 0.026
#define BUTTON_STROKE_END 0.109


@interface JVMenuButton()

@property (nonatomic, strong) CAShapeLayer *topLayer;
@property (nonatomic, strong) CAShapeLayer *bottomLayer;
@property (nonatomic, strong) CAShapeLayer *middleLayer;

@property (nonatomic) CGPathRef btnShortStroke;
@property (nonatomic) CGPathRef btnOutline;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;

@end


@implementation JVMenuButton


#pragma mark - Initializers

/**
 *  Throws an exception to indicate the use of `initWithFrame:(CGRect)frame` method instead
 *
 *  @param n/a
 *
 *  @return exception
*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"Use the `initWithFrame:(CGRect)frame` method instead."
                                 userInfo:nil];
}


/**
 *  Creates a JVMenuButton with no frame, standard color and line width. Also, initialize all dependencies of the button
 *
 *  @param n/a
 *
 *  @return a JVMenuButton
*/
- (instancetype)init
{
    return [self initWithFrame:CGRectZero color:[UIColor whiteColor] lineWidth:4];
}


/**
 *  Creates a JVMenuButton with frame, standard color and line width. Also, initialize all dependencies of the button
 *
 *  @param a CGRect which specifies the button frame
 *
 *  @return a JVMenuButton
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame color:[UIColor whiteColor] lineWidth:4];
}


/**
 *  Creates a JVMenuButton with frame, button color, button line width and initialize all dependencies of the button
 *
 *  @param a CGRect which specifies the button frame
 *  @param a UIColor which specifies the button color
 *  @param a CGFloat which specifies the button line width
 *
 *  @return a JVMenuButton
 */
- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color lineWidth:(CGFloat)lineWidth
{
    if (!(self = [super initWithFrame:frame]))
        return nil;

    // we need to check that our button has the width and height
    [self checkButtonSizeFrame:frame.size];
    
    // setting button custom color and line width
    self.color = (self.color == nil) ? color : [UIColor whiteColor];
    self.lineWidth = (self.lineWidth == 0.0f) ? lineWidth : 4;
    
    [self commonInit];
    
    return self;
}


/**
 *  Added a check for button size, to avoid odd button drawing when animating 
 *  the button should have the same width and height for animation work as expected
 *
 *  @return n/a (void)
 */
- (void)checkButtonSizeFrame:(CGSize)size
{
    if(size.width != size.height)
    {
        @throw [NSException exceptionWithName:NSGenericException
                                       reason:@"Use the same WIDTH and HEIGHT for the button frame."
                                     userInfo:nil];
    }
}


/**
 *  JVMenuButton commonInit handle all the initializer dependencies of the button
 *  here we want to set all the necessaries properties and functionality of the button
 *
 *  @return n/a (void)
*/
- (void)commonInit
{
    // keeping track of the button frame
    self.width = self.frame.size.width;
    self.height = self.frame.size.height;
    self.x = self.frame.origin.x;
    self.y = self.frame.origin.y;
    
    self.topLayer.path = self.btnShortStroke;
    self.middleLayer.path = self.btnOutline;
    self.bottomLayer.path = self.btnShortStroke;

    for(CAShapeLayer *btnLayer in @[self.topLayer, self.middleLayer, self.bottomLayer])
    {
        btnLayer.fillColor = nil;
        btnLayer.strokeColor = self.color.CGColor;
        btnLayer.lineWidth = self.lineWidth;
        btnLayer.miterLimit = self.lineWidth;
        btnLayer.lineCap = kCALineCapRound;
        btnLayer.masksToBounds = YES;
        
        CGPathRef strokingPath = CGPathCreateCopyByStrokingPath(btnLayer.path, nil, self.lineWidth, kCGLineCapRound, kCGLineJoinMiter, self.lineWidth);
        
        btnLayer.bounds = CGPathGetPathBoundingBox(strokingPath);
        
        [btnLayer setActions:@{@"strokeStart": [NSNull null],
                            @"strokeEnd": [NSNull null],
                            @"transform": [NSNull null] }];
        
        [self.layer addSublayer:btnLayer];
    }
    
    self.topLayer.anchorPoint = CGPointMake(self.width / (self.width+2.5), 0.5);
    self.topLayer.position = CGPointMake(self.width/1.35, self.width/3);
    
    self.middleLayer.position = CGPointMake(self.width/2, self.width/2);
    self.middleLayer.strokeStart = BUTTON_STROKE_START;
    self.middleLayer.strokeEnd = BUTTON_STROKE_END;
    
    self.bottomLayer.anchorPoint = CGPointMake(self.width / (self.width+2.5), 0.5);
    self.bottomLayer.position = CGPointMake(self.width/1.35, self.width/1.5);
    
}


#pragma mark - Custom getters & setters

/**
 *  Custom getter & setter for topLayer CAShapeLayer, here we want to set the property
 *  with all the values we want in it using (Lazy Loading)
 *
 *  @return a CAShapeLayer topLayer
*/
- (CAShapeLayer *)topLayer
{
    if(!_topLayer)
    {
        _topLayer = [[CAShapeLayer alloc] init];
    }
    
    return _topLayer;
}


/**
 *  Custom getter & setter for middleLayer CAShapeLayer, here we want to set the property
 *  with all the values we want in it using (Lazy Loading)
 *
 *  @return a CAShapeLayer middleLayer
 */
- (CAShapeLayer *)middleLayer
{
    if(!_middleLayer)
    {
        _middleLayer = [[CAShapeLayer alloc] init];
    }
    
    return _middleLayer;
}


/**
 *  Custom getter & setter for bottomLayer CAShapeLayer, here we want to set the property
 *  with all the values we want in it using (Lazy Loading)
 *
 *  @return a CAShapeLayer bottomLayer
 */
- (CAShapeLayer *)bottomLayer
{
    if(!_bottomLayer)
    {
        _bottomLayer = [[CAShapeLayer alloc] init];
    }
    
    return _bottomLayer;
}


/**
 *  Custom getter & setter for btnShortStroke CGPathRef, here we want to set the property
 *  with all the values we want in it
 *
 *  @return a CGPathRef btnShortStroke
 */
- (CGPathRef)btnShortStroke
{
    //create mutable path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, self.width/27, self.width/27);
    CGPathAddLineToPoint(path, nil, self.width*0.52, self.width/27);
    
    return path;
}


/**
 *  Custom getter & setter for btnOutline CGPathRef, here we want to set the property
 *  with all the values we want in it
 *
 *  @return a CGPathRef btnOutline
 */
- (CGPathRef)btnOutline
{
    //create mutable path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, self.width/5, self.width/2);
    CGPathAddCurveToPoint(path, nil, self.width/4.5,    self.width/2,       self.width*0.52,    self.width/2,       self.width/1.35,    self.width/2);
    CGPathAddCurveToPoint(path, nil, self.width*1.037,  self.width/2,       self.width/1.07,    self.width/27,      self.width/2,       self.width/27);
    CGPathAddCurveToPoint(path, nil, self.width/4.1,    self.width/27,      self.width/27,      self.width/4.1,     self.width/27,      self.width/2);
    CGPathAddCurveToPoint(path, nil, self.width/27,     self.width/1.322,   self.width/4.1,     self.width/1.038,   self.width/2,       self.width/1.038);
    CGPathAddCurveToPoint(path, nil, self.width/1.322,  self.width/1.038,   self.width/1.038,   self.width/1.322,   self.width/1.038,   self.width/2);
    CGPathAddCurveToPoint(path, nil, self.width/1.038,  self.width/4.1,     self.width/1.274,   self.width/27,      self.width/2,       self.width/27);
    CGPathAddCurveToPoint(path, nil, self.width/4.1,    self.width/27,      self.width/27,      self.width/4.1,     self.width/27,      self.width/2);
    
    return path;
}


/**
 *  Custom setter for color UIColor, here we want to set the property
 *  and update the button if its already been created
 *
 *  @param a UIColor color
 *
 *  @return n/a (void)
 */
- (void)setColor:(UIColor *)color
{
    _color = color;
    
    if(self.window)
    {
        // update button
        [self commonInit];
    }
}


/**
 *  Custom setter for lineWidth CGFloat, here we want to set the property
 *  and update the button if its already been created
 *
 *  @param a CGFloat lineWidth
 *
 *  @return n/a (void)
 */
- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    
    if(self.window)
    {
        // update button
        [self commonInit];
    }
}


/**
 *  Custom setter for showButton BOOL, here we want to set the property
 *  with all the values we want in it and excute the buttom animations
 *  depending on its showing state
 *
 *  @param a BOOL showButton
 *
 *  @return n/a (void)
*/
- (void)setShowButton:(BOOL)showButton
{
    _showButton = showButton;
    
    // trigger button animations
    [self performJVMenuButtonAnimations];
}


#pragma mark - Button animations

/**
 *  A helper functions for the button animations which is currently trigger
 *  in the setter of the showButton property
 *
 *  @return n/a (void)
 */
- (void)performJVMenuButtonAnimations
{
    CABasicAnimation *strokeStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    CABasicAnimation *strokeEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    if(self.showButton)
    {
        strokeStart.toValue = [NSNumber numberWithFloat:MENU_STROKE_START];
        strokeStart.duration = 0.5;
        strokeStart.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.25 :-0.4 :0.5 :1];
        
        strokeEnd.toValue = [NSNumber numberWithFloat:MENU_STROKE_END];
        strokeEnd.duration = 0.6;
        strokeEnd.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.25 :-0.4 :0.5 :1];
    }
    else
    {
        strokeStart.toValue = [NSNumber numberWithFloat:BUTTON_STROKE_START];
        strokeStart.duration = 0.5;
        strokeStart.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.25 :0 :0.5 :1.2];
        strokeStart.beginTime = CACurrentMediaTime() + 0.1;
        strokeStart.fillMode = kCAFillModeBackwards;
        
        strokeEnd.toValue = [NSNumber numberWithFloat:BUTTON_STROKE_END];
        strokeEnd.duration = 0.6;
        strokeEnd.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.25 :0.3 :0.5 :0.9];
    }
    
    [self.middleLayer applyAnimation:strokeStart];
    [self.middleLayer applyAnimation:strokeEnd];
    
    CABasicAnimation *topTransform = [CABasicAnimation animationWithKeyPath:@"transform"];
    topTransform.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.5 :-0.8 :0.5 :1.85];
    topTransform.duration = 0.4;
    topTransform.fillMode = kCAFillModeBackwards;
    
    CABasicAnimation *bottomTransform = (CABasicAnimation *)topTransform.copy;
    
    if(self.showButton)
    {
        CATransform3D translation = CATransform3DMakeTranslation((self.width/13.5)*-1, 0 , 0);
        
        topTransform.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(translation, -0.7853975, 0, 0, 1)];
        topTransform.beginTime = CACurrentMediaTime() + 0.25;
        
        bottomTransform.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(translation, 0.7853975, 0, 0, 1)];
        bottomTransform.beginTime = CACurrentMediaTime() + 0.25;
    }
    else
    {
        topTransform.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        topTransform.beginTime = CACurrentMediaTime() + 0.05;
        
        bottomTransform.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        bottomTransform.beginTime = CACurrentMediaTime() + 0.05;
    }
    
    [self.topLayer applyAnimation:topTransform];
    [self.bottomLayer applyAnimation:bottomTransform];

}

@end