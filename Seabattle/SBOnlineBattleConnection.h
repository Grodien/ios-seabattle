//
//  SBOnlineBattleConnection.h
//  Seabattle
//
//  Created by remo blättler on 16.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBOnlineBattleConnection : NSObject <NSStreamDelegate>

@property (nonatomic) NSInputStream *inputStream;
@property (nonatomic) NSOutputStream *outputStream;

- (void)initNetworkCommunication;

+ (SBOnlineBattleConnection*)sharedSBOnlineBattleConnection;

@end
