//
//  JEViewController.m
//  JETableView
//
//  Created by Jesse Earle on 05/07/2015.
//  Copyright (c) 2014 Jesse Earle. All rights reserved.
//

#import "JEViewController.h"
#import <JETableView/JETableView.h>

#import "JETableViewCell.h"

@interface JEViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property NSArray *data;

@end

static NSString *reuseIdentifier = @"JETableViewCell";

@implementation JEViewController

@synthesize myTableView;
@synthesize data;

- (void)viewDidLoad
{
    [super viewDidLoad];

    data = @[
             @{ @"text": @"Cell 1" },
             @{ @"text": @"Cell 2" }
             ];
    
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    __block JETableView *jeTableView = [JETableView tableView:myTableView
                                                          data:data
                                                      cellName:reuseIdentifier
                                                   cellAtIndex:^UITableViewCell *(UITableViewCell *cell, id _data) {
                   
                                                       JETableViewCell *jeCell = (JETableViewCell *)cell;
                   
                                                       jeCell.myLabel.text = [_data objectForKey:@"text"];
                                                       cell.selectionStyle = UITableViewCellSelectionStyleNone;

                                                       return cell;
        
                                                   }
                                                      selected:^(id _data) {
                                                          
                                                          jeTableView.data = @[
                                                                              @{ @"text": @"Cell 1" },
                                                                              @{ @"text": @"Cell 2" },
                                                                              @{ @"text": @"Cell 3" },
                                                                              @{ @"text": @"Cell 4" }
                                                                              ];
                                                          
                                                      }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
