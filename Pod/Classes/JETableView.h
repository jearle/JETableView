//
//  JETableView.h
//  Pods
//
//  Created by Jesse Earle on 5/7/15.
//
//

#import <Foundation/Foundation.h>
#import "JETableViewDataSource.h"
#import "JETableViewDelegate.h"

@interface JETableView : NSObject

@property JETableViewDataSource *dataSource;
@property JETableViewDelegate *delegate;
@property NSArray *data;

- (instancetype)initWithDataSource:(JETableViewDataSource *)dataSource
                          delegate:(JETableViewDelegate *)delegate;

- (void)reloadData:(NSArray *)data;

+ (JETableView *)tableView:(UITableView *)tableView
                      data:(NSArray *)data
                  cellName:(NSString *)cellName
               cellAtIndex:(UITableViewCell *(^)(UITableViewCell *cell, id data))cellAtIndexBlock
                  selected:(void(^)(id data))_selected;

@end
