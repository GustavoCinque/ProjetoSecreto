//
//  EntradaTableCell.h
//  ProjetoSecreto
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entrada.h"

@interface EntradaTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imagemTipo;
@property (strong, nonatomic) IBOutlet UILabel *valor;
@property (strong, nonatomic) IBOutlet UILabel *categoriaDescricao;
@property (strong, nonatomic) IBOutlet UILabel *data;

- (void) inserirElementos:(Entrada*) entrada;

@end
