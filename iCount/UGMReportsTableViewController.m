//
//  UGMReportsTableViewController.m
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import "UGMReportsTableViewController.h"
#import "UGMReportTableViewcontroller.h"

@interface UGMReportsTableViewController ()

@end

@implementation UGMReportsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Reports";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"ShowReportPeopleSegue" sender:indexPath];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NSString *segueId = [segue identifier];
    NSIndexPath *path = (NSIndexPath*)sender;
        UINavigationController *nav =[segue destinationViewController];
    UGMReportTableViewcontroller *reports = (UGMReportTableViewcontroller*)nav.topViewController;
    reports.selectedClientIndex = self.selectedClientIndex;
    reports.clients = self.clients;
}

@end
