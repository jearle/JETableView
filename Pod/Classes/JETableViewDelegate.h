//
//  JETableViewDelegate.h
//  Pods
//
//  Created by Jesse Earle on 5/7/15.
//
//

#import <UIKit/UIKit.h>

@interface JETableViewDelegate : NSObject

@property UITableView *tableView;
@property NSArray *data;
@property NSString *cellName;
@property (nonatomic, copy) void (^selected)(id data);

- (instancetype)initWithTableView:(UITableView *)_tableView
                             data:(NSArray *)_data
                         cellName:(NSString *)_cellName
                         selected:(void(^)(id data))_selected;

@end
