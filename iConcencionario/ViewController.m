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


-(IBAction)insertarCoche:(id)sender {
    if (numeroCoches(concesionario)<TAM_MAX) {
        NSString *modelo = _modeloTextField.text;
        float km = [_kilometrosTextField.text floatValue];
        int precio = [_precioTextField.text intValue];
        
        concesionario = insertarCoche(concesionario, [modelo cStringUsingEncoding:NSUTF8StringEncoding], precio, km);
        
        // Borra los campos de texto
        _modeloTextField.text = @"";
        _kilometrosTextField.text = @"";
        _precioTextField.text = @"";
        
        // Actualizo el Stepper
        _navegadorItems.maximumValue = (double)numeroCoches(concesionario) - 1;
        _navegadorItems.value = _navegadorItems.maximumValue;
        
        [self actualizarExplorador:_navegadorItems.maximumValue];
        
//         Alerta informativa.
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Muy bien" message:@"Has ingresado un nuevo vehículo al concesionario." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *ok) { }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        // TODO: al usuario le daremos un alerta informativa
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Busca un local más grande" message:@"El cupo máximo de coches en el concesionario está completo." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * ok) { }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
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




- (void)viewDidLoad {
    [super viewDidLoad];
    concesionario=inicializarLista(concesionario);
    
    _navegadorItems.maximumValue=0;
}


@end
