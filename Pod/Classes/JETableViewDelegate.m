//
//  JETableViewDelegate.m
//  Pods
//
//  Created by Jesse Earle on 5/7/15.
//
//

#import "JETableViewDelegate.h"

@interface JETableViewDelegate () <UITableViewDelegate>
@end

@implementation JETableViewDelegate

@synthesize tableView;
@synthesize data;
@synthesize cellName;
@synthesize selected;

- (instancetype)initWithTableView:(UITableView *)_tableView
                             data:(NSArray *)_data
                         cellName:(NSString *)_cellName
                         selected:(void(^)(id data))_selected {
    
    self = [super init];
    
    if (self) {
        
        tableView = _tableView;
        data = _data;
        cellName = _cellName;
        selected = _selected;
        
        tableView.delegate = self;
        
    }
    
    return self;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selected([data objectAtIndex:indexPath.row]);
    
}

- (CGFloat)tableView:(UITableView *)_tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellName];
    
    return cell.frame.size.height;
    
}

@end
