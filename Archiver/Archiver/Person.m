//
//  Person.m
//  Archiver
//
//  Created by steve on 2017-11-21.
//  Copyright © 2017 steve. All rights reserved.
//

#import "Person.h"

NSString* kLastNameKey = @"kLastNameKey";
NSString* kFirstNameKey = @"kFirstNameKey";
NSString* kAgeKey = @"kAgeKey";

@implementation Person
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age {
  if (self = [super init]) {
    _firstName = firstName;
    _lastName = lastName;
    _age = age;
  }
  return self;
}


@end
