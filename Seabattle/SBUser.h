//
//  SBUser.h
//  Seabattle
//
//  Created by remo blättler on 16.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBUser : NSObject

@property (strong, nonatomic) NSString *username;
@property int wins;
@property int losses;

+ (SBUser*)sharedSBUser;

@end
