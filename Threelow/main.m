//
//  main.m
//  Threelow
//
//  Created by Taylor Benna on 2016-05-04.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        GameController *diceList = [[GameController alloc] init];
        InputCollector *input = [[InputCollector alloc] init];
        
        BOOL go = YES;
        
        do {
            
            [diceList printDice];
            
            
            //User Input
            NSLog(@"----------------------------");
            NSLog(@"Current Score is: %d", [diceList getScore]);
            NSLog(@"----------------------------");
            NSLog(@"Options: ROLL | HOLD | RESET | QUIT");
            NSLog(@"----------------------------");
            NSString *usableInput = [[input inputForPrompt:@"What would you like to do?: "] uppercaseString];
            
                
            //Roll the Dice
            if ([usableInput isEqualToString:@"ROLL"]) {
                [diceList rollDice];
            }
            //Hold
            else if ([usableInput isEqualToString:@"HOLD"]) {
                NSString *usableSelection = [input inputForPrompt:@"Which Dice would you like to Hold?: "];
                [diceList holdDie:usableSelection];
            }
            //Reset
            else if ([usableInput isEqualToString:@"RESET"]) {
                [diceList resetHolds];
            }
            //Quit
            else if ([usableInput isEqualToString:@"QUIT"]) {
                go = NO;
            }
                
        }while(go == YES);
    }
    return 0;
}