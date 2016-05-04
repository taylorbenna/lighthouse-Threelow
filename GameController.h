//
//  GameController.h
//  Threelow
//
//  Created by Taylor Benna on 2016-05-04.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property (nonatomic) NSMutableArray *theDice;
@property (nonatomic) NSMutableSet *heldDice;

-(int) getScore;
-(void) printDice;
-(void) holdDie:(NSString *) input;
-(void)rollDice;
-(void) resetHolds;

@end
