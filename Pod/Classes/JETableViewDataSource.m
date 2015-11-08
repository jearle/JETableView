//
//  JETableViewDataSource.m
//  Pods
//
//  Created by Jesse Earle on 5/7/15.
//
//

#import "JETableViewDataSource.h"

@interface JETableViewDataSource () <UITableViewDataSource>

@end

@implementation JETableViewDataSource

@synthesize tableView;
@synthesize data;
@synthesize cellName;
@synthesize cellAtIndexBlock;

- (instancetype)initWithTableView:(UITableView *)_tableView
                             data:(NSArray *)_data
                         cellName:(NSString *)_cellName
                      cellAtIndex:(UITableViewCell *(^)(UITableViewCell *cell, id data))_cellAtIndexBlock {
    
    self = [super init];
    
    if (self) {
        
        tableView = _tableView;
        data = _data;
        cellName = _cellName;
        cellAtIndexBlock = _cellAtIndexBlock;
        
        tableView.dataSource = self;
        
        UINib *nib = [UINib nibWithNibName:cellName
                                    bundle:[NSBundle mainBundle]];
        
        NSLog(@"%@", self);
        
        [tableView registerNib:nib
        forCellReuseIdentifier:cellName];
        
    }
    
    return self;
    
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%@", self);
    return data.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)_tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    id dataItem = [data objectAtIndex:indexPath.row];
    
    return cellAtIndexBlock(cell, dataItem);
    
}


@end
