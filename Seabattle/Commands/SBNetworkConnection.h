//
//  SBNetworkConnection.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBPlayerCommand.h"

#define PARAM_SEPERATOR @"\t"
#define LINE_BREAK @"\n"

@interface SBNetworkConnection : NSObject <NSStreamDelegate>

@property (nonatomic) NSInputStream *inputStream;
@property (nonatomic) NSOutputStream *outputStream;
@property (strong, nonatomic) NSMutableArray *messageReceivedCallbackTargets;
@property (strong, nonatomic) NSMutableArray *messageReceivedCallbackSelectors;
@property (nonatomic) bool connected;
@property (nonatomic) NSMutableString *messageBuffer;

+ (SBNetworkConnection*)sharedInstance;
- (void)connect;
- (void)disconnect;
- (void)subscribeMessageReceived: (id) obj withSelector: (SEL) selector;
- (void)unsubscribeMessageReceived: (id) obj withSelector: (SEL) selector;
- (void)sendCommand:(SBPlayerCommand*)cmd;

@end
