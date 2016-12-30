//
//  Person.h
//  PR_1
//
//  Created by Alexandr Yanski on 28.12.16.
//  Copyright © 2016 Lonley Tree Std. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    @public NSString *_name;
    @protected NSInteger _age;
    @private NSString *_address;
}

-(id) initWithName:(NSString *) name andAge:(NSInteger) age;
+(Person*) person;
-(void) setName:(NSString *) name;
-(NSString *) name;
-(void) setAge:(NSInteger) age;
-(NSInteger) age;

-(void) setAddress:(NSString *) address;
-(NSString *) address;
-(void) descriptionOfPerson;
-(NSInteger) testStatic;
@end
