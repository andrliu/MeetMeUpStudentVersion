//
//  ViewController.m
//  MeetMeUp
//
//  Created by Dave Krawczyk on 9/8/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "Event.h"
#import "EventDetailViewController.h"
#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *searchBar;
@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self performSearchWithKeyword:@"mobile"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EventDetailViewController *detailVC = [segue destinationViewController];
    Event *e = self.dataArray[self.tableView.indexPathForSelectedRow.row];
    detailVC.event = e;
}

- (void)performSearchWithKeyword:(NSString *)keyword
{
    [Event performSearchWithKeyword:keyword andComplete:^(NSArray *events)
    {
        self.dataArray = events;
        [self.tableView reloadData];
    }];
}


#pragma mark - Tableview Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];

    Event *e = self.dataArray[indexPath.row];

    cell.textLabel.text = e.name;
    cell.detailTextLabel.text = e.address;

    [e retreiveImageWithComplete:^(NSData *data)
    {
        [cell.imageView setImage:[UIImage imageNamed:@"logo"]];

        if (data)
            [cell.imageView setImage:[UIImage imageWithData:data]];

        [cell layoutSubviews];
    }];

    return cell;
}


#pragma searchbar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self performSearchWithKeyword:searchBar.text];
    [searchBar resignFirstResponder];
}

@end
