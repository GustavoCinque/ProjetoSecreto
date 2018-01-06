//
//  CategoriaService.m
//  ProjetoSecreto
//
//  Created by Cast Group on 06/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import "CategoriaService.h"
#import "Categoria.h"

@implementation CategoriaService

+ (void) carregarCategorias:(void (^)(NSArray<Carro *> *, NSError *)) metodoParaRetorno{
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError;
        RootCarro *rootCarro = [[RootCarro alloc] initWithData:data error:&jsonError];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            metodoParaRetorno(listaCarros, nil);
        });
        
    }] resume];
    
}


@end
