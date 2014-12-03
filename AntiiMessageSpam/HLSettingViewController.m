//
//  HLSettingViewController.m
//  AntiiMessageSpam
//
//  Created by Henry Lee on 12/3/14.
//  Copyright (c) 2014 Henry Lee. All rights reserved.
//

#import "HLSettingViewController.h"

@implementation HLSetttingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]){
        
    }
    return self;
}

@end

@implementation HLSettingViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[HLSetttingCell class] forCellReuseIdentifier:NSStringFromClass([HLSetttingCell class])];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
