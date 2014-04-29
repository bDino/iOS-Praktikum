//
//  BookTableViewController.m
//  iOS_Praktikum_1
//
//  Created by Luciano Maiwald on 25.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import "BookTableViewController.h"
#import "Book.h"
#import "BookTableViewCell.h"
#import "BookDetailViewController.h"

@interface BookTableViewController ()

@property NSUInteger selectedIndex;

@end

@implementation BookTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.btnPushToNewBook = [[UIBarButtonItem alloc] initWithTitle:@"Add Book" style:UIBarButtonItemStylePlain target:self action:@selector(pushToNewBookView)];
    self.navigationItem.rightBarButtonItem = self.btnPushToNewBook;
    
    self.itemListManager = [[ItemListManager alloc] init];

    Book *book1 = [[Book alloc] initWithTitle:@"A"
                                       author:@"a1"
                                         isbn:@"a2"];

    Book *book2 = [[Book alloc] initWithTitle:@"A"
                                       author:@"b"
                                         isbn:@"c"];

    Book *book3 = [[Book alloc] initWithTitle:@"A"
                                       author:@"b"
                                         isbn:@"c"];

    [self.itemListManager addItem: book1];
    [self.itemListManager addItem: book2];
    [self.itemListManager addItem: book3];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(IBAction)pushToNewBookView
{
    [self performSegueWithIdentifier:@"pushSeqToAddBook" sender:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookTableViewCell *cell = (BookTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"bookCell" forIndexPath:indexPath];

    Book* book = (Book*)[self.itemListManager objectAtIntex:indexPath.row];

    cell.title.text = book.title;
    cell.author.text = book.author;
    cell.isbn.text = book.isbn;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.itemListManager count];
}

# pragma mark UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 108;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"pushToDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    BookDetailViewController  *targetVB = (BookDetailViewController*)segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"pushSeqToAddBook"]) {
        targetVB.manager = self.itemListManager;
    }
    else if([segue.identifier isEqualToString:@"pushToDetail"])
    {
        Book* book = (Book*)[self.itemListManager objectAtIntex:self.selectedIndex];
        targetVB.bookItem = book;
        targetVB.isEdit = YES;
    }
}

@end
