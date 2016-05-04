//
//  OutputController.m
//  Threelow
//
//  Created by Taylor Benna on 2016-05-04.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "OutputController.h"

@implementation OutputController

-(void) showMessage:(NSString *) outputMessage {
    NSLog(@"****************************");
    NSLog(@"%@", [outputMessage uppercaseString]);
    NSLog(@"****************************");
}


@end
