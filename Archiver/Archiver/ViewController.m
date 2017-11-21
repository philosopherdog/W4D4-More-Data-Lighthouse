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
  Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
  if (person == nil) {
    return;
  }
  self.firstNameField.text = person.firstName;
  self.lastNameField.text = person.lastName;
  self.ageField.text = @(person.age).stringValue;
}


- (IBAction)save {
  Person *person = [[Person alloc] initWithFirstName:self.firstNameField.text lastName:self.lastNameField.text age:[self.ageField.text intValue]];
  if (![NSKeyedArchiver archiveRootObject:person  toFile:self.path]) {
    NSLog(@"something went wrong");
  };
  
}

- (NSString *)path {
  if (!_path) {
    NSURL *docURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    _path = [docURL URLByAppendingPathComponent:@"mydata"].path;
  }
  return _path;
}



@end
