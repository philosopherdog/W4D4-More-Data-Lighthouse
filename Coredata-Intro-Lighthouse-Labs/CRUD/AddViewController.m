//
//  AddViewController.m
//  CRUD
//
//  Created by steve on 2017-07-18.
//  Copyright © 2017 steve. All rights reserved.
//

#import "AddViewController.h"
#import "DataHandler.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fName;
@property (weak, nonatomic) IBOutlet UITextField *lName;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *dogs;
@end

@implementation AddViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (IBAction)saveTapped:(UIBarButtonItem *)sender {
  NSString *fName = self.fName.text;
  NSString *lName = self.lName.text;
  int16_t age = [self.age.text intValue];
  NSString *dogs = self.dogs.text;
  NSDictionary *data = @{@"fName": fName, @"lName": lName, @"age": @(age), @"dogs": dogs};
  [self.dataHandler savePerson:data];
  [self.navigationController popViewControllerAnimated:YES];
}

@end
