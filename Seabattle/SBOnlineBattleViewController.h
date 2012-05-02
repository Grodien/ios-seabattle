//
//  SBOnlineBattleViewController.h
//  Seabattle
//
//  Created by remo blättler on 02.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBOnlineBattleViewController : UIViewController <NSStreamDelegate>


@property (nonatomic) NSInputStream *inputStream;
@property (nonatomic) NSOutputStream *outputStream;

@end
