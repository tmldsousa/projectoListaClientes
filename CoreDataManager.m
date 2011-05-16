//
//  MyClass.m
//  projectoListaClientes
//
//  Created by Tiago Sousa on 13/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import "GlobalVariables.h"

@implementation CoreDataManager

@synthesize managedObjectContext;
@synthesize fileName;

//YAY

//inicializacao com nome de ficheiro especificado
/* DESIGNATED INITIALIZER */
-(id)initWithFileName: (NSString *) file
{
    if((self = [super init]))
    {
        [self setFileName:file];
    }
    
    return self;
}

//inicializacao por defeito
-(id)init
{
    return [self initWithFileName:@"BD_Clientes.sqlite"];
}

- (NSManagedObjectContext * ) getManagedObjectContext
{
    //Se nao existir uma instancia do objecto, criar uma
    if ( nil == managedObjectContext )
    {
        //Obter os caminhos das directorias para os documentos desta aplicaçao
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        //Retirar o primeiro (principal)
        NSString *pathBase = (paths.count > 0) ? [paths objectAtIndex:0] : nil;
        
        //Construir o caminho inteiro ( URL : caminho da pasta + ficheiro.extensao)
        NSURL *fileURL = [NSURL fileURLWithPath: [pathBase stringByAppendingPathComponent:fileName]];
        
        //Criar uma PersistantStoreCoordinator para gerir as PersistantStores (no nosso caso é só a nossa BD de SQLite)
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[NSManagedObjectModel mergedModelFromBundles:nil]];
        
        //Objecto que receberá o eventual erro ao adicionar uma PersistantStore à instancia psc
        NSError *errorOpen;
        
        //Adicionar a PersistantStore com o URL que construimos há pouco, do tipo SQLiteStore
        if(nil == [psc addPersistentStoreWithType:NSSQLiteStoreType 
                                    configuration:nil 
                                              URL:fileURL 
                                          options:nil 
                                            error:&errorOpen])
        {
            //O retorno da funçao é a PersistantStore adicionada. Se for nil, houve erro e vamos escreve-lo para a consola
            /* O CONTROLO DESTE ERRO DEVE SER MUDADO: POR AGORA SÓ EXISTE UMA NOTIFICAÇAO, MAS ESTE ERRO DEVE SER DEVIDAMENTE TRATADO */
            NSLog(@"Unable to load %@",fileName);
            NSLog(@"Error: %@", errorOpen);
        }
        
        //Construir o objecto ManagedOjectContext e definir a PersistantStoreCoordinator como a instancia psc
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:psc];
        
        //Gestao de memória
        [psc release];
        [errorOpen release];
        [fileURL release];
        [pathBase release];
        [paths release];
    }
    
    //Retornar o objecto (método "get")
    return managedObjectContext;
}

- (NSArray *) fetchEntitys: (NSEntityDescription *)entityDescription WithPredicate: (NSPredicate *)predicate AndSortBy: (NSArray *)sortDescriptors
{
    NSManagedObjectContext *moc = [self managedObjectContext];
    //NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Employee" inManagedObjectContext:moc];
    //NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    [request setPredicate:predicate];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptors]];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (results == nil)
    {
        /* O CONTROLO DESTE ERRO DEVE SER MUDADO: POR AGORA SÓ EXISTE UMA NOTIFICAÇAO, MAS ESTE ERRO DEVE SER DEVIDAMENTE TRATADO */
        NSLog(@"Unable to perform fetch!");
        NSLog(@"Error: %@", error);
    }
    
    //Gestao de Memória
    [moc release];
    [request release];
    [results autorelease];
    
    return results;
}

@end
