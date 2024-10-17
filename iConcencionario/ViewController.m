//
//  ViewController.m
//  iConcencionario
//
//  Created by Christian Manzaraz on 16/10/2024.
//

#import "ViewController.h"
#include "T_ListaCoches.h"
#include "T_Coche.h"

@interface ViewController ()

@end

@implementation ViewController {
    T_ListaCoches concesionario;
}

@synthesize modeloTextField=_modeloTextField;
@synthesize kilometrosTextField=_kilometrosTextField;
@synthesize precioTextField=_precioTextField;

@synthesize navegadorItems=_navegadorItems;

@synthesize modeloLabel=_modeloLabel;
@synthesize kilometrosLabel=_kilometrosLabel;
@synthesize precioLabel=_precioLabel;
@synthesize cocheNumero=_cocheNumero;


-(IBAction)edicionFinalizada:(id)sender {
    [sender resignFirstResponder];
}


-(IBAction)cambiaStepper:(id)sender {
    
    int item=_navegadorItems.value;
    [self actualizarExplorador: item];
    
}


-(void) actualizarExplorador: (int) posLista {
    
    int item=posLista;
    
    T_Coche c = obtenerCoche(concesionario, item);
    
    _cocheNumero.text=[NSString stringWithFormat:@"%d", item+1];
    _modeloLabel.text=[NSString stringWithCString:c.modelo encoding:NSUTF8StringEncoding];
    _kilometrosLabel.text=[NSString stringWithFormat:@"%.2f", c.kilometros];
    _precioLabel.text=[NSString stringWithFormat:@"%d", c.precio];
}


//-(IBAction)insertarCoche:(id)sender;

- (void)viewDidLoad {
    [super viewDidLoad];
    concesionario=inicializarLista(concesionario);
    
    _navegadorItems.maximumValue=0;
}


@end
