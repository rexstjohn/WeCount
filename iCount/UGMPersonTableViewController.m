//
//  UGMPersonTableViewController.m
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import "UGMPersonTableViewController.h"
#import "UGMReportsTableViewcontroller.h"

@interface UGMPersonTableViewController ()
@end

@implementation UGMPersonTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"People Nearby";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedClientIndex = indexPath.row;
    [self performSegueWithIdentifier:@"ShowReportsFromPeopleSegue" sender:indexPath];
}

-(IBAction)showNewPersonModal:(id)sender{
    [self performSegueWithIdentifier:@"AddNewPersonSegue" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *segueId = [segue identifier];
    
    if([segueId isEqualToString:@"ShowReportsFromPeopleSegue"]){
        
        NSIndexPath *path = (NSIndexPath*)sender;
        
        if([[segue destinationViewController] isKindOfClass:[UINavigationController class]] == YES){
            UINavigationController *nav = segue.destinationViewController;
            UGMReportsTableViewController *reports = (UGMReportsTableViewController*)nav.topViewController;
            reports.selectedClientIndex =self.selectedClientIndex;
            reports.clients = self.clients;
        } else {
            
            UGMReportsTableViewController *reports = (UGMReportsTableViewController*)[segue destinationViewController];
            reports.selectedClientIndex =self.selectedClientIndex;
            reports.clients = self.clients;
            
        }
    }
}
@end
