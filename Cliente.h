//
//  Cliente.h
//  projectoListaClientes
//
//  Created by Tiago Sousa on 12/05/2011.
//  Copyright (c) 2011 ArquiConsult. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Cliente : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * key;
@property (nonatomic, retain) NSString * Nome;
@property (nonatomic, retain) NSString * Morada;
@property (nonatomic, retain) NSString * Contacto;
@property (nonatomic, retain) NSString * Notas;

@end
