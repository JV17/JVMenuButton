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

@end


@implementation JVMenuButton

#pragma mark - Initializers

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"Use the `initWithFrame:(CGRect)frame` method instead."
                                 userInfo:nil];
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero color:[UIColor whiteColor] lineWidth:4];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame color:[UIColor whiteColor] lineWidth:4];
}

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

- (void)checkButtonSizeFrame:(CGSize)size
{
    if(size.width != size.height)
    {
        @throw [NSException exceptionWithName:NSGenericException
                                       reason:@"Use the same WIDTH and HEIGHT for the button frame."
                                     userInfo:nil];
    }
}

- (void)commonInit
{
    // keeping track of the button frame
    self.width = self.frame.size.width;
    
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

- (CAShapeLayer *)topLayer
{
    if(!_topLayer)
    {
        _topLayer = [[CAShapeLayer alloc] init];
    }
    
    return _topLayer;
}

- (CAShapeLayer *)middleLayer
{
    if(!_middleLayer)
    {
        _middleLayer = [[CAShapeLayer alloc] init];
    }
    
    return _middleLayer;
}

- (CAShapeLayer *)bottomLayer
{
    if(!_bottomLayer)
    {
        _bottomLayer = [[CAShapeLayer alloc] init];
    }
    
    return _bottomLayer;
}

- (CGPathRef)btnShortStroke
{
    //create mutable path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, self.width/27, self.width/27);
    CGPathAddLineToPoint(path, nil, self.width*0.52, self.width/27);
    
    return path;
}

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

- (void)setColor:(UIColor *)color
{
    _color = color;
    
    if(self.window)
    {
        // update button
        [self commonInit];
    }
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    
    if(self.window)
    {
        // update button
        [self commonInit];
    }
}

- (void)setShowButton:(BOOL)showButton
{
    _showButton = showButton;
    
    // trigger button animations
    [self performJVMenuButtonAnimations];
}


#pragma mark - Button animations

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
