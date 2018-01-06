#import "PrincipalController.h"

@interface PrincipalController ()

@end

@implementation PrincipalController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self carregarCategorias];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) carregarCategorias {
    [CategoriaService carregarCategorias];
}

@end
