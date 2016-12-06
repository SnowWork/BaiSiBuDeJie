

#import "UIView+frame.h"

@implementation UIView (frame)

-(void)setX:(CGFloat)x{
    
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
    
}

-(CGFloat)x{
    
    return self.frame.origin.x;
    
}

-(void)setY:(CGFloat)y{
    
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
    
}

-(CGFloat)y{
    
    return self.frame.origin.y;
    
}

-(void)setWidth:(CGFloat)width{
    
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
    
}

-(CGFloat)width{
    
    return self.frame.size.width;
    
}

-(void)setHeight:(CGFloat)height{
    
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
    
}

-(CGFloat)height{
    
    return self.frame.size.height;
    
}


-(void)setCenterX:(CGFloat)centerX{
    
    CGRect frame = self.frame;
    
    frame.origin.x = centerX - frame.size.width/2.0;
    
    self.frame = frame;
    
}

-(CGFloat)centerX{
    
    return CGRectGetMidX(self.frame);
    
}

-(void)setCenterY:(CGFloat)centerY{
    
    CGRect frame = self.frame;
    
    frame.origin.y = centerY - frame.size.height/2.0;
    
    self.frame = frame;
    
}

-(CGFloat)centerY{
    
    return CGRectGetMidY(self.frame);
    
}




@end
