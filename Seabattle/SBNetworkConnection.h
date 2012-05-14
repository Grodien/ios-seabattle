//
//  SBNetworkConnection.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBNetworkConnection : NSObject <NSStreamDelegate>

@property (nonatomic) NSInputStream *inputStream;
@property (nonatomic) NSOutputStream *outputStream;
@property (nonatomic) NSMutableArray *messageReceivedCallbackTargets;
@property (nonatomic) NSMutableArray *messageReceivedCallbackSelectors;
@property (nonatomic) bool connected;

+ (SBNetworkConnection*)sharedInstance;
- (void)subscribeMessageReceived: (id) obj withSelector: (SEL) selector;
- (void)unsubscribeMessageReceived: (id) obj withSelector: (SEL) selector;

@end
