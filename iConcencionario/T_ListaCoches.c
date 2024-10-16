//
//  T_ListaCoches.c
//  Tutorial-1.28
//
//  Created by Christian Manzaraz on 15/10/2024.
//

#include <stdio.h>
#include <string.h>
#include "T_ListaCoches.h"


int numeroCoches(T_ListaCoches lista) {
    return lista.numeroCoches;
}

T_ListaCoches inicializarLista(T_ListaCoches lista) {
    lista.numeroCoches=0;
    return lista;
}

T_ListaCoches insertarCoche(T_ListaCoches lista, char modelo[], int precio, int kilometros) {
    
    if (lista.numeroCoches<TAM_MAX) {
        int posInsertar=lista.numeroCoches;
        
        T_Coche coche;
        
        coche.precio = precio;
        coche.kilometros = kilometros;
        strcpy(coche.modelo, modelo);
        
        lista.listaCoches[posInsertar] = coche;
        lista.numeroCoches++;
    }
    
    
    return lista;
}

T_Coche obtenerCoche(T_ListaCoches lista, int pos) {
    
    return lista.listaCoches[pos];
}


