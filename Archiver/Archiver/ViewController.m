//
//  ViewController.m
//  Archiver
//
//  Created by steve on 2017-11-21.
//  Copyright © 2017 steve. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (nonatomic) NSString *path;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadData];
}

- (void)loadData {
  //1. unarchive using path to person
  Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
  //2. load into textfields if not nil
  if (!person) {return;}
  self.firstNameField.text = person.firstName;
  self.lastNameField.text = person.lastName;
  self.ageField.text = @(person.age).stringValue;
}

- (IBAction)save {
  //1. create a person using textfields
  Person *person = [[Person alloc] initWithFirstName:self.firstNameField.text lastName:self.lastNameField.text age:self.ageField.text.intValue];
  //2. archive using root object
  if(![NSKeyedArchiver archiveRootObject:person toFile:self.path]) {
    NSLog(@"there was a problem");
  }
}

- (NSString *)path {
  if (!_path) {
    //1. get documents folder as NSURL
    NSFileManager *fm = [NSFileManager defaultManager];
    NSURL *url = [fm URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];    //2. append path component
    url = [url URLByAppendingPathComponent:@"mydata"];
    _path = url.path;
  }
  return _path;
}



@end
