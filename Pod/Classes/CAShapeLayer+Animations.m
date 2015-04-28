//
//  CAShapeLayer+Animations.m
//  Pods
//
//  Created by Jorge Valbuena on 2015-04-27.
//
//

#import "CAShapeLayer+Animations.h"


@implementation CAShapeLayer (Animations)

- (void)applyAnimation:(CABasicAnimation *)animation
{
    if(animation.fromValue == NULL)
    {
        animation.fromValue = [self.presentationLayer valueForKeyPath:animation.keyPath];
    }
    
    [self addAnimation:animation forKey:animation.keyPath];
    [self setValue:animation.toValue forKeyPath:animation.keyPath];
}

@end