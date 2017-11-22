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
  //2. load into textfields if not nil
}


- (IBAction)save {
  //1. create a person using textfields
  //2. archive using root object
}

- (NSString *)path {
  if (!_path) {
    //1. get documents folder as NSURL
    //2. append path component
  }
  return _path;
}



@end
