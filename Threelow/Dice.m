//
//  Dice.m
//  Threelow
//
//  Created by Taylor Benna on 2016-05-04.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(int)randomValue {
    return 1 + arc4random() % (6 - 1);
}



@end
