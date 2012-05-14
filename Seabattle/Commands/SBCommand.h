//
//  SBCommand.h
//  Seabattle
//
//  Created by Thomas Bomatter on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

typedef enum {
  PartialUpdate,
  FullUpdate,
  PlayerReady,
  ServerSettings,
  Error
}ServerCommand;

typedef enum {
  PlayerShoot,
  GetServerSettings,
  Ready,
  UpdateName,
  RenewGameField,
  Disconncet
}PlayerCommand;