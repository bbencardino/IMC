//
//  ContentView.swift
//  IMC
//
//  Created by Isabella Bencardino on 05/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var peso = ""
    @State private var altura = ""
    @State private var imc: Double?

    var body: some View {
        VStack {
            TextField("Peso (kg)", text: $peso)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)

            TextField("Altura (m)", text: $altura)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.decimalPad)

            Button(action: {
                calcularIMC()
            }) {
                Text("Calcular")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if let imc = imc {
                Text("IMC: \(String(format: "%.2f", imc))")
                    .padding()
            }
        }
        .padding()
    }

    func calcularIMC() {
        guard let peso = Double(peso), let altura = Double(altura), altura != 0 else {
            imc = nil
            return
        }

        let imcCalculado = peso / (altura * altura)
        imc = imcCalculado
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
