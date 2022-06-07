//
//  CommonErrors.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 07/06/22.
//

import Foundation

enum RequestError: String, Error {
    case taskFailed = "La consulta falló intentelo nuevamente."
    case couldNotDecode = "Fallo al decodificar respuesta."
    case unableToComplete = "No pudimos completar la solicitud. Por favor intenta de nuevo."
    case invalidData = "Los datos recibidos son inválidos. Por favor intenta de nuevo."
    case invalidURL = "La URL es invalida."
    
}
