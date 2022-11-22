//
//  ContentView.swift
//  ExamenIngWeb
//
//  Created by CCDM02 on 14/11/22.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    @State var id = ""
    @State var nombre = ""
    @State var apellido = ""
    @State var username = ""
    @State var rolid = ""
    @State var activo = ""
    @State var usuarioArray = [Usuario]()
    var body: some View {
        VStack{
            TextField("ID Usuario", text: $id)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Nombre Usuario", text: $nombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Apellido Usuario", text: $apellido)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Username Usuario", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("RolID Usuario", text: $rolid)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Activo Usuario", text: $activo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Guardar"){
                coreDM.guardarUsuario(id: id, nombre: nombre, apellido: apellido, username: username, activo: activo, rolid: rolid)
                mostrarUsuarios()
                id = ""
                nombre = ""
                apellido = ""
                username = ""
                rolid = ""
                activo = ""
            }
            List{
                ForEach(usuarioArray, id: \.self){
                    user in
                    VStack{
                        Text(user.id ?? "")
                        Text(user.nombre ?? "")
                        Text(user.apellido ?? "")
                        Text(user.username ?? "")
                        Text(user.rolid ?? "")
                        Text(user.activo ?? "")
                    }
                }
                onDelete(perform: {
                    indexSet in
                    indexSet.forEach({index in
                        let usuario = usuarioArray[index]
                        coreDM.borrarUsuario(usuario: usuario)
                        mostrarUsuarios()
                    })
                })
            }
        }
    }
    
    func mostrarUsuarios(){
        usuarioArray = coreDM.leerTodosLosUsuarios()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
