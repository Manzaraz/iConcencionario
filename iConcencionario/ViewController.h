//
//  ViewController.h
//  iConcencionario
//
//  Created by Christian Manzaraz on 16/10/2024.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property IBOutlet UITextField *modeloTextField;
@property IBOutlet UITextField *kilometrosTextField;
@property IBOutlet UITextField *precioTextField;

@property IBOutlet UIStepper *navegadorItems;

@property IBOutlet UILabel *modeloLabel;
@property IBOutlet UILabel *kilometrosLabel;
@property IBOutlet UILabel *precioLabel;
@property IBOutlet UILabel *cocheNumero;

-(IBAction)cambiaStepper:(id)sender;
-(IBAction)insertarCoche:(id)sender;
-(IBAction)edicionFinalizada:(id)sender;

@end

