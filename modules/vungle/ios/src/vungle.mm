//
//  vungle.mm
//
//
//  Created by Poq Xert on 09.06.2020.
//

#include "vungle.h"
#import <VungleAdapter/VungleAdapter.h>
#import <VungleSDK/VungleSDK.h> 


static GodotVungle *godotVungleInstance = NULL;


GodotVungle::GodotVungle() {
    godotVungleInstance = this;
}

GodotVungle::~GodotVungle() {
    
}

void GodotVungle::initialize() {

//  NSLog(@"Initializing Vungle..."); 
  NSLog(@"Setting Test Device..."); 

GADMobileAds.sharedInstance.requestConfiguration.testDeviceIdentifiers = @[ @"e43d78825622c71ec436256b5b721953" ];
/*  
  GADRequest *request = [GADRequest request];
  VungleAdNetworkExtras *extras = [[VungleAdNetworkExtras alloc] init];
  
  NSMutableArray *placements = [[NSMutableArray alloc] initWithObjects:@"BUILDTIME-5766006", @"DOUBLE_REWARDS-6924376", nil];
  extras.allPlacements = placements;
  [request registerAdNetworkExtras:extras];
*/

}
void GodotVungle::_bind_methods() {
    ClassDB::bind_method(D_METHOD("initialize"), &GodotVungle::initialize);
}
