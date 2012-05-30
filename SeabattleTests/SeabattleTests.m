//
//  SeabattleTests.m
//  SeabattleTests
//
//  Created by Thomas Bomatter on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SeabattleTests.h"
#import "SBPlayer.h"
#import "SBNetworkConnection.h"

@implementation SeabattleTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testInitMySelf
{
  NSString* name = @"Thomas";
  NSUserDefaults *usernameDefault = [NSUserDefaults standardUserDefaults];
  [usernameDefault setObject:name forKey:@"Username"];
  
  SBPlayer *player = [[SBPlayer alloc] initMySelf];
  STAssertEquals(name, player.name, @"Player Name not Equal");
}

/*- (void)testNetworkConnection {
  [[SBNetworkConnection sharedInstance] connect];
  
  STAssertTrue([SBNetworkConnection sharedInstance].connected, @"Failed to connect");
  
  [[SBNetworkConnection sharedInstance] disconnect];
  
  STAssertTrue([SBNetworkConnection sharedInstance].connected, @"Failed to disconnect");
}*/

@end
