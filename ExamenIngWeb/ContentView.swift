//
//  ContentView.swift
//  ExamenIngWeb
//
//  Created by CCDM02 on 14/11/22.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    @State var id : Int16
    @State var nombre = ""
    @State var apellido = ""
    @State var username = ""
    @State var rolid : Int16
    @State var activo : Int16
    @State var usuarioArray = [Usuario]()
    var body: some View {
        VStack{
            TextField("ID Usuario", value: $id, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Nombre Usuario", text: $nombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Apellido Usuario", text: $apellido)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Username Usuario", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("RolID Usuario", value: $id, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Activo Usuario", value: $id, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Guardar"){
                coreDM.guardarUsuario(id: id, nombre: nombre, apellido: apellido, username: username, activo: activo, rolid: rolid)
                mostrarUsuarios()
                id = 0
                nombre = ""
                apellido = ""
                username = ""
                rolid = 0
                activo = 0
            }
            List{
                ForEach(usuarioArray, id: \.self){
                    user in
                    VStack{
                        Text(user.id)
                        Text(user.nombre ?? "")
                        Text(user.apellido ?? "")
                        Text(user.username ?? "")
                        Text(user.rolid)
                        Text(user.activo)
                    }
                }
                .onDelete(perform: {
                    indexSet in
                    indexSet.forEach({index in
                        let usuario = usuarioArray[index]
                        coreDM.borrarUsuario(usuario: usuario)
                        mostrarUsuarios()
                    })
                })
            }
            Spacer()
        }.padding()
            .onAppear(perform: {
                mostrarUsuarios()
                
            })
    }
    
    func mostrarUsuarios(){
        usuarioArray = coreDM.leerTodosLosUsuarios()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM:CoreDataManager())
    }
}
