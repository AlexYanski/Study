//
//  Person.m
//  PR_1
//
//  Created by Alexandr Yanski on 28.12.16.
//  Copyright © 2016 Lonley Tree Std. All rights reserved.
//

#import "Person.h"

static NSInteger testSTVar = 0;

@implementation Person

-(id) initWithName:(NSString *) name andAge:(NSInteger) age{
    if(self = [super init]){
        _name = name;
        _age = age;
    }
    return self;
}

+(Person *) person {
    Person* result = [[Person alloc] init];
    [result setName:@"No"];
    return result;
}

// MARK: name
-(void) setName:(NSString *) name{
    _name = [[NSString alloc] initWithString:name];
}
-(NSString *) name{
    return _name;
}

// MARK: age
-(void) setAge:(NSInteger) age{
    _age = age;
}
-(NSInteger) age{
    return _age;
}

// MARK: address
-(void) setAddress:(NSString *) address{
    _address = [[NSString alloc]initWithString:address];
}
-(NSString *) address{
    return _address;
}

-(void) descriptionOfPerson{
    NSLog(@"Hi! My name is %@",_name);
    NSLog(@"I'm %li",_age);
    NSLog(@"My address is %@",_address);
    NSLog(@"End");
}

-(NSInteger) testStatic {
    return testSTVar;
}

@end
