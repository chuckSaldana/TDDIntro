//
//  GeneradorDeEtapasDelDia.swift
//  TDDIntro
//
//  Created by Carlos Saldana on 6/21/16.
//  Copyright © 2016 Jaguar Labs. All rights reserved.
//

import UIKit

class GeneradorDeEtapasDelDia: NSObject {
    
    func calcularEtapaDelDia(dateTime: NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()
        let date = dateTime
        let components = calendar.components([.Hour], fromDate: date)
        
        if components.hour > 7 && components.hour < 12 {
            return "De mañana"
        }
        if components.hour == 12 {
            return "Medio día"
        }
        if components.hour > 12 && components.hour < 19 {
            return "Tarde"
        }
        if components.hour > 19 && components.hour < 24 {
            return "Noche"
        }
        if components.hour == 24 {
            return "Media noche"
        }
        if components.hour > 0 && components.hour < 7 {
            return "Madrugada"
        }
        
        return "Error en calculo de etapa del día"
    }
}
