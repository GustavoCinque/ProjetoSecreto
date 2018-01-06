//
//  CategoriaDao.h
//  ProjetoSecreto
//
//  Created by Cast Group on 06/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Categoria+CoreDataClass.m"

@interface CategoriaDao : NSObject

+ (Categoria*) newInstance;
+ (BOOL) salvar:(Categoria*) categoria;
+ (void) remover:(Categoria*) categoria;
+ (NSMutableArray*) pesquisarTodos:(NSManagedObjectContext*) context;

@end
