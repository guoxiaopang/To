//
//  PeopleDetailController.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleDetailController.h"
#import "PeopleDetailNormalTableViewCell.h"
#import "PeopleDetailDataManager.h"
#import "UIColor+Hex.h"
#import "PeopleDetailInfoModel.h"
#import "PeopleDetailSectionView.h"
#import "PeopleDetailHeadView.h"
#import "PeopleDetailInfoModel.h"
#import "PeopleDetailNormalEditTableViewCell.h"
//#import "PeopleDetailTagManager.h"
//#import "PeopleDetailTagCell.h"
#import "PeopleDetailThingTableViewCell.h"
#import "PeopleDetailThingManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "UserManager.h"

static NSString *peopleDetailNormalTableViewCellIdent = @"peopleDetailNormalTableViewCellIdent";
static NSString *peopleDetailSectionViewIdent = @"peopleDetailSectionViewIdent";
static NSString *peopleDetailendCell = @"peopleDetailendCell";
static NSString *peopleDetailEditCell = @"peopleDetailEditCellIdent";
static NSString *peopleDetailTagCellIdent = @"PeopleDetailTagCellIdent";
static NSString *peopleDetailThingTableViewCellIdent = @"peopleDetailThingTableViewCellIdent";

@interface PeopleDetailController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)PeopleDetailDataManager *dataManager;
@property(nonatomic, strong)PeopleDetailHeadView *headView;
@property(nonatomic, strong)UIBarButtonItem *rightBarButtonItem;
// 保存用户输入的值 防止重用数据消失
@property(nonatomic, strong)NSMutableDictionary *cellValueDict;
//@property(nonatomic, strong)PeopleDetailTagManager *tagManager;
@property(nonatomic, strong)PeopleDetailThingManager *thingManager;
@property(nonatomic, strong) UIButton *addButton;

@end

@implementation PeopleDetailController
{
    BOOL _addStatus;
    BOOL _moveStatus;
    UserModel *_userModel;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"人物详情";
    UINavigationBar *bar = self.navigationController.navigationBar;
    [bar setShadowImage:[[UIImage alloc] init]];
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;

    [[UIApplication sharedApplication].keyWindow addSubview:self.addButton];
}

#warning 记得删除

- (void)dealloc
{
    [self.addButton removeFromSuperview];
}

- (UIButton *)addButton
{
    if (!_addButton)
    {
        _addButton = [[UIButton alloc] init];
        [_addButton setTitle:@"add" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(addThing) forControlEvents:UIControlEventTouchUpInside];
        _addButton.frame = CGRectMake(10, 80, 40, 60);

    }
    return _addButton;
}

- (void)addThing
{
    ThingModel *model = [ThingModel MR_createEntity];
    model.thingID = [NSUUID UUID].UUIDString;
    model.content = @"这是测试这是测试这是测试这是测试这是测试这是测试这是测试啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
    double time = [NSDate date].timeIntervalSince1970;
    model.time = [NSString stringWithFormat:@"%f", time];
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectsFromArray:_userModel.eventArray];
    [array addObject:model.thingID];
    _userModel.eventArray = array;
    [[UserManager shareInstance] changeUser:_userModel];
    [self.thingManager requestThing:_userModel];
    [self.tableView reloadData];

}

- (void)reloadData:(UserModel *)model
{
    [self setUpTableView];
    // headView赋值
    [self.headView headViewReloadData:model];
    self.dataManager.model = model;
    _userModel = model;
    
    [self.thingManager requestThing:model];
   // self.tagManager.model = model;
}

#pragma mark - 懒加载
- (PeopleDetailThingManager *)thingManager
{
    if (!_thingManager)
    {
        _thingManager = [[PeopleDetailThingManager alloc] init];
    }
    return _thingManager;
}

- (NSMutableDictionary *)cellValueDict
{
    if (!_cellValueDict)
    {
        _cellValueDict = [NSMutableDictionary dictionary];
    }
    return _cellValueDict;
}

- (void)setUpTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor colorWithHex:0Xf6f5f1];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerClass:[PeopleDetailNormalTableViewCell class] forCellReuseIdentifier:peopleDetailNormalTableViewCellIdent];
    [self.tableView registerClass:[PeopleDetailSectionView class] forHeaderFooterViewReuseIdentifier:peopleDetailSectionViewIdent];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:peopleDetailendCell];
    [self.tableView registerClass:[PeopleDetailNormalEditTableViewCell class] forCellReuseIdentifier:peopleDetailEditCell];
  //  [self.tableView registerClass:[PeopleDetailTagCell class] forCellReuseIdentifier:peopleDetailTagCellIdent];
    [self.tableView registerClass:[PeopleDetailThingTableViewCell class] forCellReuseIdentifier:peopleDetailThingTableViewCellIdent];
    self.tableView.showsVerticalScrollIndicator = false;
    self.tableView.tableHeaderView = self.headView;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

- (UIBarButtonItem *)rightBarButtonItem
{
    if (!_rightBarButtonItem)
    {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(clickEdit:)];
        _rightBarButtonItem.tintColor = [UIColor whiteColor];
    }
    return _rightBarButtonItem;
}

- (PeopleDetailHeadView *)headView
{
    if (!_headView)
    {
        _headView = [[PeopleDetailHeadView alloc] init];
        _headView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 300);
        _headView.backgroundColor = [UIColor colorWithHex:0X5677FC];
    }
    return _headView;
}

- (PeopleDetailDataManager *)dataManager
{
    if (!_dataManager)
    {
        _dataManager = [[PeopleDetailDataManager alloc] init];
    }
    return _dataManager;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        if ([tableView isEditing])
        {
            return [self.dataManager numberOfSection] + 1;
        }
        return [self.dataManager numberOfSection];
    }
    else
    {
        return [self.thingManager numOfRow];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if ([tableView isEditing] && indexPath.row == [self.dataManager numberOfSection])
        {
            // 最后一个cell
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:peopleDetailendCell];
            cell.textLabel.text = @"add...";
            return cell;
        }
        else if ([tableView isEditing] && indexPath.row == ([self.dataManager numberOfSection] - 1) && _addStatus)
        {
            PeopleDetailNormalEditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:peopleDetailEditCell];
            PeopleDetailInfoModel *model = self.cellValueDict[@(indexPath.row)];
            [cell reloadData:model];
            __weak typeof(self) weakSelf = self;
            [cell returnBlock:^(NSString *title, NSString *value) {
                PeopleDetailInfoModel *model = [[PeopleDetailInfoModel alloc] init];
                model.title = title;
                model.value = value;
                weakSelf.cellValueDict[@(indexPath.row)] = model;
            }];
            return cell;
        }
        else
        {
            PeopleDetailNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:peopleDetailNormalTableViewCellIdent];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            PeopleDetailInfoModel *model = [self.dataManager modelWithRow:indexPath.row];
            [cell reloadData:model];
            return cell;
        }
    }
    else
    {
        PeopleDetailThingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:peopleDetailThingTableViewCellIdent];
        ThingModel *model = [self.thingManager modelWithRow:indexPath.row];
        [cell reloadData:model];
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PeopleDetailSectionView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:peopleDetailSectionViewIdent];
    if (section == 0)
    {
        [view reloadData:@"人物详情"];
    }
    else
    {
        [view reloadData:@"事件"];
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return _moveStatus;
    }
    else
    {
        return false;
    }
}

// 设置cell编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == ([self.dataManager numberOfSection]))
    {
        return UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleDelete; // 返回none就不会出现图标
    }
}

// 编辑状态进行提交
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    PeopleDetailInfoModel *model = [self.dataManager modelWithRow:indexPath.row];
    switch (editingStyle)
    {
        case UITableViewCellEditingStyleDelete:
            // 修改数据源 刷新tableView
            [self.dataManager deleteModel:model];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case UITableViewCellEditingStyleInsert:
            _addStatus = true;
            [self.dataManager insertModelAtindex:indexPath.row];
            [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            break;
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _moveStatus;
}

// 移动设置
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // 修改数据源
    [self.dataManager changeSourceIndexPath:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    // 让表视图对应进行移动
    [tableView exchangeSubviewAtIndex:sourceIndexPath.row withSubviewAtIndex:destinationIndexPath.row];
}

#pragma mark - Void
- (void)clickEdit:(UIBarButtonItem *)button
{
    if ([button.title isEqualToString:@"编辑"])
    {
        [self.tableView setEditing:YES animated:YES];
        [button setTitle:@"完成"];
        _moveStatus = true;
    }
    else
    {
        [self.tableView setEditing:NO animated:YES];
        [button setTitle:@"编辑"];
        _addStatus = false;
        _moveStatus = false;
        NSArray *array = self.cellValueDict.allKeys;
        for (NSNumber *key in array)
        {
            PeopleDetailInfoModel *model = self.cellValueDict[key];
            if (model)
            {
                 [self.dataManager insertModel:model index:[key integerValue]];
            }
        }
        [self.cellValueDict removeAllObjects];
    }
    [self.tableView reloadData];
}

@end
