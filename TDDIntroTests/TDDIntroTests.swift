//
//  TDDIntroTests.swift
//  TDDIntroTests
//

/*
MIT License

Copyright (c) 2016 Carlos Saldana Garcia

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/


import UIKit
import XCTest

class TDDIntroTests: XCTestCase {
    
    var generator: GeneradorDeEtapasDelDia?
    var mainVC: MainVC?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        generator = GeneradorDeEtapasDelDia()
        mainVC = MainVC(nibName:"MainVC", bundle:nil)
        mainVC!.loadView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        generator = nil
        mainVC = nil
        super.tearDown()
    }
    
    func testCalcularEtapaDelDiaNoNil() {
        // This is an example of a functional test case.
        let dateTime = NSDate()
        let etapa = generator!.calcularEtapaDelDia(dateTime);
        XCTAssertNotNil(etapa)
    }
    
    func testCalcularEtapaDelDiaDeMadrugada() {
        let etapa = generator!.calcularEtapaDelDia(fechaParaHora(6));
        XCTAssertEqual(etapa, "Madrugada")
    }
    
    func testMainView() {
        XCTAssertNotNil(mainVC!.view)
    }
    
    func testEtiquetaEtapaDelDia() {
        XCTAssertNotNil(mainVC!.etiquedaEtapaDelDia)
    }
    
    func testMuestraEtapaDelDia() {
        mainVC!.muestraEtapaDelDia(NSDate())
        XCTAssertNotNil(mainVC!.etiquedaEtapaDelDia?.text)
    }
    
    func testMuestraEtapaDelDiaDeNoche() {
        mainVC!.muestraEtapaDelDia(fechaParaHora(23))
        XCTAssertEqual(mainVC!.etiquedaEtapaDelDia?.text, "Noche")
    }
    
    func testMuestraEtapaDelDiaAlIniciar() {
        XCTAssertNotNil(mainVC!.etiquedaEtapaDelDia?.text)
    }
    
    func fechaParaHora(hora: Int) -> NSDate {
        
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let components = NSDateComponents()
        components.year = 2016
        components.month = 6
        components.day = 21
        components.hour = hora
        
        return (calendar?.dateFromComponents(components))!
    }
}
