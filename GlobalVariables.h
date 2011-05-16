//
//  GlobalVariables.h
//  projectoListaClientes
//
//  Created by Tiago Sousa on 15/05/2011.
//  Copyright 2011 ArquiConsult. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataManager.h"

// Esta class é um singleton - Só existe uma instancia por cada processo, dada pelo class-method sharedInstance
// Isto significa que a instancia é partilhada por toda a aplicaçao.
// - Ver implementaçao desta class para mais detalhes -
// Source: http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaObjects/CocoaObjects.html#//apple_ref/doc/uid/TP40002974-CH4-SW32

@interface GlobalVariables : NSObject {
    CoreDataManager * coreDataManager;  //Objecto GLOBAL que tem as variaveis e métodos necessários para lidar com os meus dados
}

@property (retain) CoreDataManager * coreDataManager;

+ (GlobalVariables *) sharedInstance;   //Método que me dá a instancia desta class ou a cria se ainda nao existir alguma

@end
