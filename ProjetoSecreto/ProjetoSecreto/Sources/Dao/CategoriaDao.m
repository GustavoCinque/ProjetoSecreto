//
//  CategoriaDao.m
//  ProjetoSecreto
//
//  Created by Cast Group on 06/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import "CategoriaDao.h"
#import "Categoria+CoreDataClass.m"
#import "AppDelegate.h"

@implementation CategoriaDao

+ (NSManagedObjectContext*)context{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

+ (Categoria *) newInstance {
    // Cria uma instância do Carro (inserindo no managed object context)
    Categoria *c = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Categoria class]) inManagedObjectContext:[CategoriaDao context]];
    return c;
}

+ (BOOL) salvar:(Categoria*) categoria {
    NSManagedObjectContext *context = [CategoriaDao context];
    
    categoria.id = [CategoriaDao pesquisarUltimoId:context];
    
    NSError *error;
    return [context save:&error];
}

+ (void) remover:(Categoria*) categoria {
    NSManagedObjectContext *context = [CategoriaDao context];
    [context deleteObject:categoria];
    [context save:nil];
}

+ (NSMutableArray*) pesquisarTodos:(NSManagedObjectContext*) context {
    if(!context){
        context = [CategoriaDao context];
    }
    NSFetchRequest *request = [Categoria fetchRequest];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"id"
                                                                   ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    NSError *error;
    NSMutableArray *array = [[context executeFetchRequest:request error:&error] mutableCopy];
    return array;
}

+ (NSInteger) pesquisarUltimoId:(NSManagedObjectContext*) context {
    return [[[CategoriaDao pesquisarTodos:context] lastObject] id];
}


@end
