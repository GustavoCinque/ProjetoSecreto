#import "PrincipalController.h"
#import "CargaCategoriaStoryboardController.h"

@interface PrincipalController ()

@end

@implementation PrincipalController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)adicionarPrimeiraCarga:(id)sender {
    CargaCategoriaStoryboardController *newView = [CargaCategoriaStoryboardController new];
    newView.carga = [NSNumber numberWithInt:1];
    [self.view addSubview:newView.view];
}

- (IBAction)adicionarSegundaCarga:(id)sender {
    CargaCategoriaStoryboardController *newView = [CargaCategoriaStoryboardController new];
    newView.carga = [NSNumber numberWithInt:2];
    [self.view addSubview:newView.view];
}

@end
