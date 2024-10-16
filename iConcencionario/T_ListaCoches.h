//
//  T_ListaCoches.h
//  Tutorial-1.28
//
//  Created by Christian Manzaraz on 15/10/2024.
//

#ifndef T_ListaCoches_h
#define T_ListaCoches_h

#define TAM_MAX 20

#include "T_Coche.h"

struct listaCoches {
    int numeroCoches;
    T_Coche listaCoches[TAM_MAX];
};

typedef struct listaCoches T_ListaCoches;

int numeroCoches(T_ListaCoches lista);

T_ListaCoches inicializarLista(T_ListaCoches lista);

T_ListaCoches insertarCoche(T_ListaCoches lista, char modelo[], int precio, int kilometros);

T_Coche obtenerCoche(T_ListaCoches lista, int pos);


#endif /* T_ListaCoches_h */
