//
//  Programmer.h
//  PR_1
//
//  Created by Alexandr Yanski on 29.12.16.
//  Copyright © 2016 Lonley Tree Std. All rights reserved.
//

#import "Person.h"

@interface Programmer : Person {
    NSInteger _progExp;
}

-(void) setProgExp:(NSInteger) progExp;
-(NSInteger) progExp;

@end
