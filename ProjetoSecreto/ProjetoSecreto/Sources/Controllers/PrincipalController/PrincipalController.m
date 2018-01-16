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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"primeiraCarga"]) {
        CargaCategoriaStoryboardController *destino = segue.destinationViewController;
        destino.carga = [NSNumber numberWithInt:1];
    } else if([segue.identifier isEqualToString:@"segundaCarga"]) {
        CargaCategoriaStoryboardController *destino = segue.destinationViewController;
        destino.carga = [NSNumber numberWithInt:2];
    }
}

@end
