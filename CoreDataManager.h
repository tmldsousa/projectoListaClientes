//
//  MyClass.h
//  projectoListaClientes
//
//  Created by Tiago Sousa on 13/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject {
    NSManagedObjectContext * managedObjectContext;  //Objecto que controla os objectos que existem entre a aplicaçao e os dados físicos
                                                    //Ver documentaçao para perceber melhor as suas funçoes
    NSString *fileName; //Nome do ficheiro (com extensao) no qual vamos trabalhar
}

@property (nonatomic, retain) NSManagedObjectContext * managedObjectContext;
@property (nonatomic, retain) NSString *fileName;

@end
