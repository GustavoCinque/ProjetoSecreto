//
//  CargaCategoriaStoryboardController.m
//  ProjetoSecreto
//
//  Created by Adriano Carnaroli on 14/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import "CargaCategoriaStoryboardController.h"
#import "CategoriaService.h"
#import "CategoriaDao.h"
#import "DBCategoria+CoreDataClass.h"

@interface CargaCategoriaStoryboardController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property(strong, nonatomic) CategoriaService *categoriaService;

@property(strong, nonatomic) CategoriaDao *categoriaDao;

@end

@implementation CargaCategoriaStoryboardController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categoriaService = [CategoriaService new];
    self.categoriaDao = [CategoriaDao new];
    
    [_spinner startAnimating];
    if([self.carga intValue] == 1) {
        [self.categoriaService carregarPrimeiraCargaCategorias:^(NSArray<Categoria *> *categorias, NSError *error) {
            if (error) {
                NSLog(@"Erro: %@", error.localizedDescription);
            }
            [self carregarCargaCategorias: categorias];
        }];
    } else if([self.carga intValue] == 2) {
        [self.categoriaService carregarSegundaCargaCategorias:^(NSArray<Categoria *> *categorias, NSError *error) {
            if (error) {
                NSLog(@"Erro: %@", error.localizedDescription);
            }
            [self carregarCargaCategorias: categorias];
            
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) carregarCargaCategorias:(NSArray<Categoria *>*) categorias {
    for (Categoria *categoria in categorias) {
        [self.categoriaDao salvar:[self criarDBCategoria: categoria]];
    }
    
    [_spinner stopAnimating];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (DBCategoria*) criarDBCategoria:(Categoria*)categoria{
    DBCategoria *dbCategoria = [DBCategoria new];
    dbCategoria.descricao = categoria.descricao;
    dbCategoria.idCategoria = categoria.idCategoria;
    dbCategoria.tipoEntrada = categoria.tipoEntrada;
    return dbCategoria;
}

@end
