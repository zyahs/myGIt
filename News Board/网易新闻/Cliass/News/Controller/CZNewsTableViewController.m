//
//  CZNewsTableViewController.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZNewsTableViewController.h"
#import "CZNewsCell.h"
#import "CZNews.h"
@interface CZNewsTableViewController ()
/**
 *  <#Description#>
 */
@property (nonatomic,strong)NSArray *innerNewsList;
@end

@implementation CZNewsTableViewController

- (void)setTidURLString:(NSString *)tidURLString
{
    _tidURLString = tidURLString;
//    NSLog(@"%@",tidURLString);
    //调用模型的方法去放松求情
    __weak typeof (self) weakSelf =  self   ;
    [CZNews newsListWithURLString:tidURLString finishedBlock:^(NSArray *newList) {
        //把数据解析,转成控制器需要的模型数据
        self.innerNewsList = newList;
        
        [weakSelf.tableView reloadData];
        
    }];
    
}








- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.innerNewsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = nil;
    
    CZNews *news = self.innerNewsList[indexPath.row];
    if (news.imgType) {
        str = @"BigCell";
    }else if (news.imgextra.count == 2)
    {
    str = @"ThreeImage";
    }
    else
    {
    str = @"BaseCell";
    }
    
    CZNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:str forIndexPath:indexPath];

    // Configure the cell...
    
    cell.news =self.innerNewsList[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
CZNews *news = self.innerNewsList[indexPath.row];
    if (news.imgType) {
        return 180;
    }else if (news.imgextra.count == 2)
    {
        return 120;
    }
    else
    {
        return 80;
    }

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
