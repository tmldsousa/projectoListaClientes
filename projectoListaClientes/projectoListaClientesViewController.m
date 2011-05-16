//
//  projectoListaClientesViewController.m
//  projectoListaClientes
//
//  Created by Tiago Sousa on 12/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import "projectoListaClientesViewController.h"

@implementation projectoListaClientesViewController

@synthesize tableViewClientes;

- (void)dealloc
{
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //O tamanho da table view (o numero de entradas na tableview) vai ser igual ao numero de clientes que exitem
    
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"defaultCell"];
    //Inicializar a celula para ser posta na table view
    if(cell == nil)
        cell = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:@"defaultCell"];
    
    cell.textLabel.text = [dataSourceArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //Obter os dados
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] init];
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:psc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cliente"
                                              inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    
    NSError *error = nil;
    
    //Inicializar o array com os dados obtidos
    dataSourceArray = [managedObjectContext executeFetchRequest:request error:&error];
    
    tableViewClientes.dataSource = self;
    [request release];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
