//
//  GameController.m
//  Threelow
//
//  Created by Taylor Benna on 2016-05-04.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"
#import "OutputController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.theDice = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            Dice *dice = [[Dice alloc] init];
            dice.rolledNumber = [dice randomValue];
            [self.theDice addObject:dice];
        }
        self.heldDice = [[NSMutableSet alloc] init];
    }
    return self;
}

- (int) getScore {
    int score = 0;
    for (Dice *die in self.theDice) {
        if (die.rolledNumber == 3) {
            score += 0;
        }
        else {
            score += die.rolledNumber;
        }
    }
    return score;
}

-(void) printDice {
    int i = 0;
    NSMutableString *output = [[NSMutableString alloc] init];
    NSMutableString *addition = [[NSMutableString alloc] init];
    for (Dice *die in self.theDice) {
        if ([self.heldDice containsObject:[NSString stringWithFormat:@"%d", i + 1] ]) {
            addition = [NSMutableString stringWithString:@" - HELD"];
        }
        else {
            addition = [NSMutableString stringWithString:@""];
        }
        switch(die.rolledNumber) {
            case 1: output = [NSMutableString stringWithFormat:@"dice %d value: ⚀%@", i + 1, addition];
                break;
            case 2: output = [NSMutableString stringWithFormat:@"dice %d value: ⚁%@", i + 1, addition];
                break;
            case 3: output = [NSMutableString stringWithFormat:@"dice %d value: ⚂%@", i + 1, addition];
                break;
            case 4: output = [NSMutableString stringWithFormat:@"dice %d value: ⚃%@", i + 1, addition];
                break;
            case 5: output = [NSMutableString stringWithFormat:@"dice %d value: ⚄%@", i + 1, addition];
                break;
            case 6: output = [NSMutableString stringWithFormat:@"dice %d value: ⚅%@", i + 1, addition];
                break;
        }
        NSLog(@"%@", output);
        i++;
    }
}

-(void) holdDie: (NSString *)input {
    OutputController *output = [[OutputController alloc] init];
    
    if ([input integerValue] <= 6 && [input integerValue] >= 1) {
        if (![self.heldDice containsObject:input]) {
            [self.heldDice addObject:input];
        }
        else {
            [self.heldDice removeObject:input];
            //[output showMessage:@"That die is already held!"];
        }
    }
    else {
        [output showMessage:@"Incompatible Input"];
    }
}

-(void)rollDice {
    int i = 0;
    for (Dice *die in self.theDice) {
        if (![self.heldDice containsObject: [NSString stringWithFormat:@"%d", i + 1]]) {
            die.rolledNumber = [die randomValue];
        }
        i++;
    }
}

-(void) resetHolds {
    [self.heldDice removeAllObjects];
}


@end
