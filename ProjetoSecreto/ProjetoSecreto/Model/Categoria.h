//
//  Categoria.h
//  ProjetoSecreto
//
//  Created by Cast Group on 06/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONAPI.h"

@interface Categoria : JSONModel

@property(nonatomic, strong) NSString *descricao;
@property(nonatomic, strong) NSString *idCategoria;
@property(nonatomic, strong) NSString *tipoEntrada;

@end

@protocol Categoria
@end

@interface Categorias : JSONModel

@property(nonatomic, strong) NSArray<Categoria> *categorias;

@end
