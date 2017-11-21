//
//  Person.h
//  Archiver
//
//  Created by steve on 2017-11-21.
//  Copyright © 2017 steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) int age;
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age;
@end
