//
//  SBGameFieldView.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBGameFieldView.h"
#import "SBGame.h"

@implementation SBGameFieldView

@synthesize gameField;
@synthesize hideShips;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      gameField = [[SBPlayField alloc] init];
      hideShips = false;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  CGContextRef contextRef = UIGraphicsGetCurrentContext();
  CGContextClearRect(contextRef, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
  CGContextSetRGBFillColor(contextRef, 255, 255, 255, 1);
  CGContextFillRect(contextRef, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
  CGContextSetRGBFillColor(contextRef, 0, 0, 0, 1);
  CGContextSetRGBStrokeColor(contextRef, 0, 0, 0, 1);
  
  int fieldLength = self.frame.size.width / [SBGame size];
  
  for (NSInteger i = 0; i < [gameField.fieldData count]; i++) {
    for (NSInteger j = 0; j < [[gameField.fieldData objectAtIndex:i] count]; j++) {

      int fieldValue = [[[gameField.fieldData objectAtIndex:i] objectAtIndex:j] intValue];
      
      if (fieldValue == VALUE_FREE) {
        CGContextStrokeRect(contextRef, CGRectMake(j*fieldLength, i*fieldLength, fieldLength, fieldLength));
      } else if (fieldValue == VALUE_FREE_HIT) {
        CGContextStrokeRect(contextRef, CGRectMake(j*fieldLength, i*fieldLength, fieldLength, fieldLength));
        CGContextSetRGBFillColor(contextRef, 0, 0, 255, 1);
        CGContextFillRect(contextRef, CGRectMake(j*fieldLength+2, i*fieldLength+2, fieldLength-4, fieldLength-4));
        CGContextSetRGBFillColor(contextRef, 0, 0, 0, 1);
      } else if (fieldValue == VALUE_SHIP) {
        CGContextStrokeRect(contextRef, CGRectMake(j*fieldLength, i*fieldLength, fieldLength, fieldLength));
        if (!hideShips) {
          CGContextFillEllipseInRect(contextRef, CGRectMake(j*fieldLength, i*fieldLength, fieldLength, fieldLength));
        } 
      } else if (fieldValue == VALUE_SHIP_HIT) {
        CGContextStrokeRect(contextRef, CGRectMake(j*fieldLength, i*fieldLength, fieldLength, fieldLength));
        
        CGContextSetRGBFillColor(contextRef, 255, 0, 0, 1);
        
        CGContextFillEllipseInRect(contextRef, CGRectMake(j*fieldLength, i*fieldLength, fieldLength, fieldLength));
        
        CGContextSetRGBFillColor(contextRef, 0, 0, 0, 1);
      }
    }
  }
}


@end
