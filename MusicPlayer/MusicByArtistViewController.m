//
//  MusicByArtistViewController.m
//  MusicPlayer
//
//  Created by Cartman on 13-6-16.
//  Copyright (c) 2013年 Cartman. All rights reserved.
//

#import "MusicByArtistViewController.h"
#import "MusicInfoCell.h"
#import "SongsOfArtistViewController.h"
@interface MusicByArtistViewController ()

{
    
}
@property (strong, nonatomic) SongsOfArtistViewController *songsViewController;
@end

@implementation MusicByArtistViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"歌手";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [musicByArtist count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MusicInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = (MusicInfoCell *)[[[NSBundle mainBundle] loadNibNamed:@"MusicInfoCell" owner:self options:nil] objectAtIndex:0];
    }
    NSArray *collections = [[musicByArtist objectAtIndex:indexPath.row] items];
    NSString *cellText=[[collections objectAtIndex:0] valueForProperty:MPMediaItemPropertyArtist];
    NSString *smallText=[NSString stringWithFormat:@"%i首歌曲",[collections count]];
    MPMediaItemArtwork *artwork = [[collections objectAtIndex:0] valueForProperty:MPMediaItemPropertyArtwork];
    UIImage *albumCover = [artwork imageWithSize:CGSizeMake(35, 35)];
    if(!albumCover)
    {
        albumCover = [UIImage imageNamed:@"cover.png"];
    }
    cell.upperTextLabel.text = cellText;
    cell.albumCoverView.image = albumCover;
    cell.lowerTextLabel.text = smallText;
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MPMediaItemCollection *collection = [musicByArtist objectAtIndex:indexPath.row];
            self.songsViewController = [[SongsOfArtistViewController alloc] initWithCollection:collection index:indexPath.row];
        //self.songsViewController.songsOfArtist = [NSMutableArray arrayWithArray:collections];
        //self.songsViewController.index = indexPath.row;
    [self.navigationController pushViewController:self.songsViewController animated:YES];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
