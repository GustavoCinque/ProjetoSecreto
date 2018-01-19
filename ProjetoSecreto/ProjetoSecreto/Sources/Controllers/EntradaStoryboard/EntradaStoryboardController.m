//
//  EntradaStoryboardController.m
//  ProjetoSecreto
//
//  Created by Adriano Carnaroli on 18/01/18.
//  Copyright © 2018 Sig. All rights reserved.
//

#import "EntradaStoryboardController.h"

@interface EntradaStoryboardController ()

@property(nonatomic, strong) UITextField *campoTexto;
@property(nonatomic, strong) UITextView *campoTextoView;
@property (strong, nonatomic) IBOutlet UILabel *labelTipoEntrada;

@end

@implementation EntradaStoryboardController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.receita) {
        self.labelTipoEntrada.text = @"Adicionar Receita";
    } else {
        self.labelTipoEntrada.text = @"Adicionar Despesa";
    }
    
    [self.view setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.5]];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.campoTexto = textField;
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.campoTexto) {
        [self.campoTexto resignFirstResponder];
        self.campoTexto = nil;
    }
    
    if(self.campoTextoView) {
        [self.campoTextoView resignFirstResponder];
        self.campoTextoView = nil;
    }
    
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    self.campoTextoView = textView;
    return YES;
}

- (IBAction)salvar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)descartar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
