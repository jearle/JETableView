//
//  JETableView.m
//  Pods
//
//  Created by Jesse Earle on 5/7/15.
//
//

#import "JETableView.h"

@interface JETableView ()

@end

@implementation JETableView

@synthesize dataSource;
@synthesize delegate;

- (instancetype)initWithDataSource:(JETableViewDataSource *)_dataSource
                          delegate:(JETableViewDelegate *)_delegate {
    
    self = [super init];
    
    if (self) {
        
        dataSource = _dataSource;
        delegate = _delegate;
        
    }
    
    return self;
    
}

- (void)reloadData:(NSArray *)data {
    
    dataSource.data = data;
    delegate.data = data;
    
    [dataSource.tableView reloadData];
    
}

- (void)setData:(NSArray *)data {
    
    [self reloadData:data];
    
}

- (NSArray *)data {
    
    return dataSource.data;
    
}

+ (JETableView *)tableView:(UITableView *)tableView
                      data:(NSArray *)data
                  cellName:(NSString *)cellName
               cellAtIndex:(UITableViewCell *(^)(UITableViewCell *cell, id data))cellAtIndexBlock
                  selected:(void(^)(id data))_selected {
    
    JETableViewDataSource *dataSource = [[JETableViewDataSource alloc] initWithTableView:tableView
                                                                                    data:data
                                                                                cellName:cellName
                                                                             cellAtIndex:cellAtIndexBlock];
    
    JETableViewDelegate *delegate = [[JETableViewDelegate alloc] initWithTableView:tableView
                                                                              data:data
                                                                          cellName:cellName
                                                                          selected:_selected];
    
    return [[JETableView alloc] initWithDataSource:dataSource
                                          delegate:delegate];
    
}

@end
