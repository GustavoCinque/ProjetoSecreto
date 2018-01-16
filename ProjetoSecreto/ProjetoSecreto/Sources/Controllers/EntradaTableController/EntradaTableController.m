//
//  EntradaTableController.m
//  ProjetoSecreto
//
//  Created by Adriano Carnaroli on 16/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import "EntradaTableController.h"
#import "EntradaDao.h"
#import "Entrada.h"
#import "CategoriaDao.h"

@interface EntradaTableController ()
@property (strong, nonatomic) IBOutlet UILabel *somatorioReceitas;
@property (strong, nonatomic) IBOutlet UILabel *somatorioDespesas;

@property(nonatomic, strong) EntradaDao *entradaDao;
@property(nonatomic, strong) NSMutableArray<Entrada*> *entradas;
@property(nonatomic, assign) NSNumber *count;

@property(nonatomic,strong) CategoriaDao *categoriaDao;

@end

@implementation EntradaTableController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.entradaDao = [EntradaDao new];
    
    NSArray<DBEntrada*>* dbEntradas = [self.entradaDao pesquisarTodos];
    self.entradas = [@[] mutableCopy];
    
    NSArray<DBCategoria*>* dbCategorias = [self.categoriaDao pesquisarTodos];
    
    NSMutableArray *categorias = [@[] mutableCopy];
    
    for (DBCategoria *dbCategoria in dbCategorias) {
        Categoria *categoria = [Categoria new];
        [categoria setDescricao:dbCategoria.descricao];
        [categoria setIdCategoria: [NSNumber numberWithInt:dbCategoria.idCategoria]];
        [categoria setTipoEntrada:dbCategoria.tipoEntrada];
        [categorias addObject:categoria];
    }
    
    for (DBEntrada *dbEntrada in dbEntradas) {
        int idEntrada = [self.count intValue] + 1;
        Entrada *entrada = [Entrada new];
        [entrada setData:dbEntrada.data];
        [entrada setValor:[NSNumber numberWithDouble:dbEntrada.valor]];
        [entrada setUsuario:[NSNumber numberWithInt:dbEntrada.usuario]];
        [entrada setLatitude:[NSNumber numberWithDouble:dbEntrada.latitude]];
        [entrada setLongitude:[NSNumber numberWithDouble:dbEntrada.longitude]];
        [entrada setCategoria:categorias[dbEntrada.categoria]];
        [entrada setIdEntrada:[NSNumber numberWithInt:idEntrada]];
        [self.entradas addObject:entrada];
    }
    
    
    self.count = [NSNumber numberWithUnsignedInteger:self.entradas.count];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
