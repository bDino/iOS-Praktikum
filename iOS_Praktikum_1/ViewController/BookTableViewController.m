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

    Book *book1 = [[Book alloc] initWithTitle:@"On the Road"
                                       author:@"Jack Kerouac"
                                         isbn:@"978-0141182674"];

    Book *book2 = [[Book alloc] initWithTitle:@"Fight Club"
                                       author:@"Chuck Palahniuk"
                                         isbn:@"978-3442542109"];

    Book *book3 = [[Book alloc] initWithTitle:@"Pippi Langstrumpf"
                                       author:@"Astrid Lindgren"
                                         isbn:@"978-3789141614"];

    Book *book4 = [[Book alloc] initWithTitle:@"Power Fail - The Ultimate Songbook"
                                       author:@"Power Fail"
                                         isbn:@"0945826714895"];

    [self.itemListManager saveItem: book1];
    [self.itemListManager saveItem: book2];
    [self.itemListManager saveItem: book3];
    [self.itemListManager saveItem: book4];
}

-(IBAction)pushToNewBookView
{
    [self performSegueWithIdentifier:@"pushToAddBook" sender:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
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

    BookDetailViewController  *targetVC = (BookDetailViewController*)segue.destinationViewController;

    if ([segue.identifier isEqualToString:@"pushToDetail"])
    {
        Book* book = (Book*)[self.itemListManager objectAtIntex:self.selectedIndex];
        targetVC.itemListManager = self.itemListManager;
        targetVC.book = book;
    } else if ([segue.identifier isEqualToString:@"pushToAddBook"])
    {
        targetVC.itemListManager = self.itemListManager;
        targetVC.book = [[Book alloc] init];
    }
}

@end
