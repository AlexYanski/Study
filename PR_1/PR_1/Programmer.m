//
//  Programmer.m
//  PR_1
//
//  Created by Alexandr Yanski on 29.12.16.
//  Copyright © 2016 Lonley Tree Std. All rights reserved.
//

#import "Programmer.h"

@implementation Programmer 

-(void) setProgExp:(NSInteger) progExp{
    _progExp = progExp;
}
-(NSInteger) progExp{
    return _progExp;
}
-(void) descriptionOfPerson{
    [super descriptionOfPerson];
    NSLog(@"I'm programmer and my experience is %li year",_progExp);
}
@end
