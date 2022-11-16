//
//  CoreDataManager.swift
//  ExamenIngWeb
//
//  Created by CCDM02 on 16/11/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer : NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer("Usuario")
        persistentContainer.loadPersitentStores(completionHandler: {
            (descripcion, error) in
            if let error = error {
                faltaError("Core data failed to initizliazee \(error.localizedDescription)")
            }
        })
    }
    
    func guardarUsuario(id:Int16, codigo: String, nombre:String, apellido:String, username:String, activo:Int16, rolid:Int16){
        let usuario = Usuario(context: persistentContainer.viewContext)
        usuario.nombre = nombre
        usuario.apellido = apellido
        usuario.id = id
        usuario.username = username
        usuario.activo = activo
        usuario.rolid = rolid
        
        do{
            try persistentContainer.viewContext.save()
            print("producto guardado")
        }
        catch{
            print("Failed to save error en \(error)")
        }
        
    }
    
}
