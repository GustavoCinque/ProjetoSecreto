#import "CategoriaService.h"
#import "Categoria.h"

@implementation CategoriaService

+ (void) carregarPrimeiraCargaCategorias:(void (^)(NSArray<Categoria *> *, NSError *)) metodoParaRetorno{
    NSURL *url = [NSURL URLWithString:@"https://raw.githubusercontent.com/GustavoCinque/ProjetoSecreto/master/categorias_primeiracarga.json"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError;
        RootCarro *rootCarro = [[RootCarro alloc] initWithData:data error:&jsonError];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            metodoParaRetorno(listaCarros, nil);
        });
        
    }] resume];
}

+ (void) carregarSegundaCargaCategorias:(void (^)(NSArray<Categoria *> *, NSError *)) metodoParaRetorno{
    NSURL *url = [NSURL URLWithString:@"https://raw.githubusercontent.com/GustavoCinque/ProjetoSecreto/master/categorias_segundacarga.json"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError;
        RootCarro *rootCarro = [[RootCarro alloc] initWithData:data error:&jsonError];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            metodoParaRetorno(listaCarros, nil);
        });
        
    }] resume];
}



@end
