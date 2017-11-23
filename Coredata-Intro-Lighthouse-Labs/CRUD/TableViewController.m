//
//  TableViewController.m
//  CRUD
//
//  Created by steve on 2017-07-18.
//  Copyright © 2017 steve. All rights reserved.
//

#import "TableViewController.h"
#import "Person+CoreDataClass.h"
#import "AddViewController.h"
#import "DataHandler.h"
#import "Dog+CoreDataClass.h"

@interface TableViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray<Person*>*persons;
@property (nonatomic) DataHandler *dataHandler;
@end

@implementation TableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.dataHandler = [DataHandler new];
  [self fetchData];
  [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(fetchData) name:NSManagedObjectContextDidSaveNotification object:nil];
}

- (void)fetchData {
  self.persons = [self.dataHandler fetchData];
}

- (void)setPersons:(NSArray<Person *> *)persons {
  _persons = persons;
  [self.tableView reloadData];
}

#pragma mark - DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return self.persons.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.persons[section].dogs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  Person *person = self.persons[indexPath.section];
  Dog *dog = person.dogs[indexPath.row];
  cell.textLabel.text = dog.name;
  cell.detailTextLabel.text = person.lastName;
  return cell;
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [NSString stringWithFormat:@"%@'s %@ Dogs", self.persons[section].lastName, @(self.persons[section].dogs.count)];
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"AddViewController"]) {
    AddViewController *avc = segue.destinationViewController;
    avc.dataHandler = self.dataHandler;
  }
}

#pragma mark - Teardown

- (void)dealloc {
  [NSNotificationCenter.defaultCenter removeObserver:self];
}


@end
