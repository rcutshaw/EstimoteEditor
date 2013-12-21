//
//  CBXpcConnection+Swizzled.m
//  Estimote Editor
//
//  Created by Sandeep Mistry on 12/21/2013.
//

#import <objc/runtime.h>

#import "CBXpcConnection+Swizzled.h"

@implementation CBXpcConnection (Swizzled)

+ (void)load
{
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, @selector(handleMsg:args:));
    swizzled = class_getInstanceMethod(self, @selector(handleMsgSwizzled:args:));
    method_exchangeImplementations(original, swizzled);
    
    original = class_getInstanceMethod(self, @selector(sendMsg:args:));
    swizzled = class_getInstanceMethod(self, @selector(sendMsgSwizzled:args:));
    method_exchangeImplementations(original, swizzled);
}

- (void)handleMsgSwizzled:(int)arg1 args:(id)arg2
{
    int msgId = arg1;
    NSDictionary *args = arg2;
    
    NSString *deviceUUID = [[args objectForKey:@"kCBMsgArgDeviceUUID"] UUIDString];
    
    if (msgId == 4) {
        NSLog(@"state change: %@", [args objectForKey:@"kCBMsgArgState"]);
        
    } else if (msgId == 34) {
        NSDictionary *advertisementData = [args objectForKey:@"kCBMsgArgAdvertisementData"];
        
        NSLog(@"device discovered: %@, name = %@", deviceUUID, [advertisementData objectForKey:@"kCBAdvDataLocalName"]);
        
    } else if (msgId == 35) {
        NSLog(@"device connected: %@", deviceUUID);
    } else if (msgId == 51) {
        NSLog(@"device services discovered: %@", deviceUUID);
    } else if (msgId == 59) {
        NSLog(@"device service characteristics discovered: %@", deviceUUID);
    } else if (msgId == 65) {
        NSLog(@"device characteristic read: %@, handle = %@, value = %@", deviceUUID, [args objectForKey:@"kCBMsgArgCharacteristicHandle"], [args objectForKey:@"kCBMsgArgData"]);
    } else if (msgId == 66) {
        NSLog(@"device characteristic written: %@, handle = %@", deviceUUID, [args objectForKey:@"kCBMsgArgCharacteristicHandle"]);
    } else {
        NSLog(@"handleMsg: %d, %@", arg1, arg2);
    }
    
    [self handleMsgSwizzled:arg1 args:arg2];
}

- (void)sendMsgSwizzled:(int)arg1 args:(id)arg2
{
    int msgId = arg1;
    NSDictionary *args = arg2;
    
    NSString *deviceUUID = [[args objectForKey:@"kCBMsgArgDeviceUUID"] UUIDString];
    
    if (msgId == 1) {
        NSLog(@"XPC connection init");
    } else if (msgId == 28){
        NSLog(@"start scanning");
    } else if (msgId == 29){
        NSLog(@"stop scanning");
    } else if (msgId == 30){
        NSLog(@"connect: %@", deviceUUID);
    } else if (msgId == 41){
        NSLog(@"discover services: %@", deviceUUID);
    } else if (msgId == 57){
        NSLog(@"discover service characteristics: %@", deviceUUID);
    } else if (msgId == 60){
        NSLog(@"device read characteristic: %@, handle %@", deviceUUID, [args objectForKey:@"kCBMsgArgCharacteristicHandle"]);
    } else if (msgId == 61){
        NSLog(@"device write characteristic: %@, handle %@, value = %@", deviceUUID, [args objectForKey:@"kCBMsgArgCharacteristicHandle"], [args objectForKey:@"kCBMsgArgData"]);
    } else {
        NSLog(@"sendMsg: %d, %@", arg1, arg2);
    }
    
    [self sendMsgSwizzled:arg1 args:arg2];
}

@end
