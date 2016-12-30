//
//  main.m
//  PR_1
//
//  Created by Alexandr Yanski on 28.12.16.
//  Copyright © 2016 Lonley Tree Std. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "House.h"
#import "Programmer.h"

NSInteger gTestGlobal = 1;

int main(int argc, const char * argv[]) {
    
    Person *person1 = [Person alloc];
    person1 = [person1 init];
    
    Programmer *person2 = [[Programmer alloc]init];//Person *person2 = [[Person alloc]initWithName:@"Jack" andAge:30];//[Person person];//[[Person alloc] init];
    
    Person *person3 = [Person new];
    
    //House *house = [[House alloc] initWithAddress:@"Victory St."];
    
    //[house setAddress:@"Victory St."];
    
    [person1 setAge:25];
    [person1 setName:@"Sasha"];
    [person1 setAddress:@"M.Tank"];
    //[person1 descriptionOfPerson];
    
    //[person2 setAge:30];
    //[person2 setName:@"Misha"];
    [person2 setProgExp:1];
    //[person2 descriptionOfPerson];
    
    [person3 setAge:35];
    [person3 setName:@"Jake"];
    //[person3 descriptionOfPerson];
    
    //[house settlePerson:person1];
    //[house descriptionOfHouse];
    NSLog(@"%@",[person1 name]);
    
    person1 -> _name=@"Mike";
    
    NSLog(@"%@",[person1 name]);
    //NSLog(@"%li",[person1 testStatic]);
    [person2 descriptionOfPerson];
    NSLog(@"%li",[person2 age]);
    
    @autoreleasepool {
            // NSLog(@"Hello, World!");
    }
    return 0;
}

