//
//  CategoriaDao.m
//  ProjetoSecreto
//
//  Created by Cast Group on 06/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import "CategoriaDao.h"
#import "AppDelegate.h"

@implementation CategoriaDao

+ (NSManagedObjectContext*)context{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

- (BOOL) salvar:(DBCategoria*) categoria {
    NSManagedObjectContext *context = [CategoriaDao context];
    
    categoria.idCategoria = [CategoriaDao pesquisarUltimoId:context];
    
    NSError *error;
    return [context save:&error];
}

- (void) remover:(DBCategoria*) categoria {
    NSManagedObjectContext *context = [CategoriaDao context];
    [context deleteObject:categoria];
    [context save:nil];
}

+ (NSArray<DBCategoria*>*) pesquisarTodos:(NSManagedObjectContext*) context {
    if(!context){
        context = [CategoriaDao context];
    }
    NSFetchRequest *request = [DBCategoria fetchRequest];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"idCategoria" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    NSError *error;
    NSArray *array = [context executeFetchRequest:request error:&error];
    return array;
}

+ (NSInteger) pesquisarUltimoId:(NSManagedObjectContext*) context {
    return [[[CategoriaDao pesquisarTodos:context] lastObject] idCategoria];
}


@end
