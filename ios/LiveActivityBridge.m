//
//  LiveActivityBridge.m
//  Lama
//
//  Created by Joao Vitor Falco on 23/03/23.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(LiveActivityModule, NSObject)

RCT_EXTERN_METHOD(testFunc)


RCT_EXTERN_METHOD(startNotificationActivity:(NSString *) title withMessage:(NSString *) message)
RCT_EXTERN_METHOD(updateNotificationActivity:(NSString *) message)
RCT_EXTERN_METHOD(endNotificationActivity)
@end
