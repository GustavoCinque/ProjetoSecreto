//
//  EntradaDao.m
//  ProjetoSecreto
//
//  Created by Adriano Carnaroli on 16/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import "EntradaDao.h"
#import "AppDelegate.h"

@implementation EntradaDao

- (DBEntrada *) newInstance {
    DBEntrada *c = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([DBEntrada class]) inManagedObjectContext:[EntradaDao context]];
    return c;
}

+ (NSManagedObjectContext*)context{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

- (BOOL) salvar {
    NSManagedObjectContext *context = [EntradaDao context];
    NSError *error;
    return [context save:&error];
}

- (void) remover:(DBEntrada*) categoria {
    NSManagedObjectContext *context = [EntradaDao context];
    [context deleteObject:categoria];
    [context save:nil];
}

- (NSArray<DBEntrada*>*) pesquisarTodos{
    NSFetchRequest *request = [DBEntrada fetchRequest];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"idEntrada" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    NSError *error;
    NSArray *array = [[EntradaDao context] executeFetchRequest:request error:&error];
    return array;
}

@end
