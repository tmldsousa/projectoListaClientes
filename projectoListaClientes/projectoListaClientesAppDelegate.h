//
//  projectoListaClientesAppDelegate.h
//  projectoListaClientes
//
//  Created by Tiago Sousa on 12/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class projectoListaClientesViewController;

@interface projectoListaClientesAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet projectoListaClientesViewController *viewController;

@end
