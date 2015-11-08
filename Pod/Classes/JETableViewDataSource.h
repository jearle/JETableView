//
//  JETableViewDataSource.h
//  Pods
//
//  Created by Jesse Earle on 5/7/15.
//
//

#import <UIKit/UIKit.h>

@interface JETableViewDataSource : NSObject

@property UITableView *tableView;
@property NSArray *data;
@property NSString *cellName;
@property (nonatomic, copy) UITableViewCell *(^cellAtIndexBlock)(UITableViewCell *cell, id data);

- (instancetype)initWithTableView:(UITableView *)_tableView
                             data:(NSArray *)_data
                         cellName:(NSString *)_cellName
                      cellAtIndex:(UITableViewCell *(^)(UITableViewCell *cell, id data))_cellAtIndexBlock;

@end
