//
//  CalculatorModel.m
//  PR_2
//
//  Created by Alexandr Yanski on 04.01.17.
//  Copyright © 2017 Lonley Tree Std. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel

- (CGFloat)performOperand:(CGFloat)operand {
    CGFloat value = self.currendOperand;
    
    if ([self.operation isEqualToString:@"X"]){
        value *= operand;
    }
    else if ([self.operation isEqualToString:@"/"]){
        value /= operand;
    }
    else if ([self.operation isEqualToString:@"+"]){
        value += operand;
    }
    else if ([self.operation isEqualToString:@"-"]){
        value -= operand;
    }
    return value;
}
@end
