//
//  House.m
//  PR_1
//
//  Created by Alexandr Yanski on 28.12.16.
//  Copyright © 2016 Lonley Tree Std. All rights reserved.
//

#import "House.h"

@implementation House

-(id) initWithAddress:(NSString *) address{
    if(self = [super init]){
        _address = address;
    }
    return self;
}

-(void) setAddress:(NSString *) address{
    _address = [[NSString alloc]initWithString:address];
}
-(NSString *) address{
    return _address;
}

-(void) settlePerson:(Person *) person{
    if (person){
        if (_listOfResidents){
            [_listOfResidents addObject:person];
        } else {
            _listOfResidents = [[NSMutableArray alloc]initWithObjects:person, nil];
        }
        [person setAddress:[self address]];
    }
}
-(void) evictPerson:(Person *) person{
    if(person){
        [_listOfResidents removeObject:person];
    }
    [person setAddress:@"No address"];
}
-(void) descriptionOfHouse{
    NSLog(@"Address of this house is %@",_address);
    NSLog(@"List of residents:");
    
    if (_listOfResidents){
        for (NSInteger i=0; i<[_listOfResidents count]; i++){
            Person *p = [_listOfResidents objectAtIndex:i];
            NSLog(@"- %@",[p name]);
        }
    }
}

@end

