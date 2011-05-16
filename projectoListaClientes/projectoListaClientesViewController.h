//
//  projectoListaClientesViewController.h
//  projectoListaClientes
//
//  Created by Tiago Sousa on 12/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface projectoListaClientesViewController : UIViewController 
<UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *tableViewClientes;

}

@property (nonatomic, retain) UITableView *tableViewClientes;


@end
