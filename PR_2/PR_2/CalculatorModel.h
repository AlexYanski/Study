//
//  CalculatorModel.h
//  PR_2
//
//  Created by Alexandr Yanski on 04.01.17.
//  Copyright © 2017 Lonley Tree Std. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CalculatorModel : NSObject

@property (copy,nonatomic) NSString *operation;
@property (nonatomic) CGFloat currendOperand;

- (CGFloat)performOperand:(CGFloat)operand; 

@end
