//
//  House.h
//  PR_1
//
//  Created by Alexandr Yanski on 28.12.16.
//  Copyright © 2016 Lonley Tree Std. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface House : NSObject {
    NSString *_address;
    NSMutableArray *_listOfResidents;
}

-(id) initWithAddress:(NSString *) address;
-(void) setAddress:(NSString *) address;
-(NSString *) address;
-(void) settlePerson:(Person *) person;
-(void) evictPerson:(Person *) person;

-(void) descriptionOfHouse;
@end
