//
//  ESTBeacon+Swizzled.h
//  Estimote Editor
//
//  Created by Sandeep Mistry on 12/21/2013.
//

#import <Foundation/Foundation.h>

#import <ESTBeacon.h>

@interface ESTBeacon (Swizzled)

// original
- (void)pairSensorFirstPart;
- (void)pairSensorSecondPart;

// swizzled
- (void)pairSensorFirstPartSwizzled;
- (void)pairSensorSecondPartSwizzled;

@end
