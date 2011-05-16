//
//  GlobalVariables.m
//  projectoListaClientes
//
//  Created by Tiago Sousa on 15/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import "GlobalVariables.h"

//Source: http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaObjects/CocoaObjects.html#//apple_ref/doc/uid/TP40002974-CH4-SW32

@implementation GlobalVariables

@synthesize coreDataManager;

static GlobalVariables *sharedGlobalVariables = nil;    //Está aqui guardada a instancia estática (e unica) da minha class

+ (GlobalVariables *) sharedInstance
{
    //Se nao existir uma instancia, cria uma
    if (sharedGlobalVariables == nil) {
        sharedGlobalVariables = [[super allocWithZone:NULL] init];
    }
    
    //Retorna a instancia desta classe
    return sharedGlobalVariables;
}

//Override a estes métodos impede que se crie outras instancias deste objecto
//E se trate da parte da gestao de memória como deve ser feito
+ (id)allocWithZone:(NSZone *)zone
{
    return [[self sharedInstance] retain];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

@end
