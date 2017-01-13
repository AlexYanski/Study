//
//  ViewController.m
//  PR_2
//
//  Created by Alexandr Yanski on 04.01.17.
//  Copyright © 2017 Lonley Tree Std. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) CalculatorModel *model;

@property (nonatomic) BOOL waitNextOperand;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[CalculatorModel alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onEqualPressed:(UIButton *)sender {
    CGFloat value = [self.model performOperand:self.valueLabel.text.floatValue];
    NSInteger temp = [self.model performOperand:self.valueLabel.text.integerValue];
    if (value - temp != 0){
        self.valueLabel.text = [NSString stringWithFormat:@"%f",value];
    }
    else {
        self.valueLabel.text = [NSString stringWithFormat:@"%li",temp];
    }
    self.model.currendOperand = value;
}

- (IBAction)onClearPressed:(UIButton *)sender {
    self.valueLabel.text = @"0";
    self.model.operation = nil;
}

- (IBAction)onOpertionPressed:(UIButton *)sender {
    self.model.operation = sender.titleLabel.text;
    self.model.currendOperand = self.valueLabel.text.floatValue;
    self.waitNextOperand = YES;
}

- (IBAction)onOperandPressed:(UIButton *)sender {
    NSString *value = self.valueLabel.text;
    if ([value isEqualToString:@"0"] || self.waitNextOperand){
        value = @"";
        self.waitNextOperand = NO;
    }
    value = [value stringByAppendingString:sender.titleLabel.text];
    self.valueLabel.text = value;
}

- (IBAction)onPlusMinusPressed:(UIButton *)sender {
    CGFloat tempValue = self.valueLabel.text.floatValue;
    NSInteger temp = tempValue;
    if (tempValue - temp != 0){
        self.valueLabel.text = [NSString stringWithFormat:@"%f", -tempValue];
    }
    else {
        self.valueLabel.text = [NSString stringWithFormat:@"%li",-temp];
    }
    
    self.waitNextOperand = NO;
}

- (IBAction)onSqrtPressed:(UIButton *)sender {
    CGFloat valueSqrt = [self.model performOperand:self.valueLabel.text.floatValue];
    NSInteger tempSqrt = [self.model performOperand:self.valueLabel.text.integerValue];
    self.valueLabel.text = @"";
    if (valueSqrt - tempSqrt != 0){
        self.valueLabel.text = [NSString stringWithFormat:@"√%f",valueSqrt];
    }
    else {
        self.valueLabel.text = [NSString stringWithFormat:@"√%li",tempSqrt];
    }
}

@end
