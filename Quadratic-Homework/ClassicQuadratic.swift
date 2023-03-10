//
//  ClassicQuadratic.swift
//  Quadratic-Homework
//
//  Created by IIT PHYS 440 on 1/27/23.
//

import SwiftUI
import Foundation

class ClassicQuadratic: NSObject {
    var variableA = "0.0"
    var variableB = "0.0"
    var variableC = "0.0"
    var solutionstring :(String, Double, Double, Double, Double) = ("", 0.0, 0.0, 0.0, 0.0)
    var discriminant = 0.0
    var solvedDisc = 0.0
    var errormargin = 0.0
    //TEST TEST TEST
    
    
    /// This function calculates quadratic equation's analytic solutions, first by finding the discriminant (b^2 - 4ac). Then it performs a switch case, depending on what form the disciminant takes. if the discriminant is equal to or more than zero, then there are not any imaginary numbers to display, and as such the part of the tuple containing the "imaginary" part is displayed as 0, and the "real" part of the tuple calculates the simplified form of the quadratic formula, without the imaginary part.
    ///
    /// There are five parts of the tuple. solutionstring.0 merely displays the type of solutions that are being calculated (One/two real roots, or two complex roots). solutionstring.1 and .3 display the real portions of the two solutions if there is only one solution, these tuples are identical. solutionstring.2 and .4 display the imaginary parts of the solutions. the "i" is not recognized as a number by the computer, and as such the i must be removed.
    ///
    /// For the case where the discriminant is less than 0, the square root of the discriminat is redefined, as to remove the imaginary part of it out, which will be placed back when displayed in ContentView.
    ///
    ///   Real              Imaginary (=0 if only one real root)
    ///   - b          sqrt(Discriminant)
    ///    ---  +/-  ---------------------
    ///    2a                   2a
    func calculateTypeofSolutions()  {
        var a = Double(variableA)!
        var b = Double(variableB)!
        var c = Double(variableC)!
        
        discriminant = ((b * b) - (4 * a * c))
        
        switch discriminant {
        case let x where x < 0:
            let sqrtDisc = sqrt(-discriminant)
            solutionstring.0 = "Two Complex Roots"
            solutionstring.1 = (-b) / (2 * a)
            solutionstring.2 = (sqrtDisc/(2*a))
            solutionstring.3 = (-b) / (2 * a)
            solutionstring.4 = -(sqrtDisc/(2*a))
        case let x where x == 0:
            solutionstring.0 = "One Real Root"
            solutionstring.1 = (-b) / (2 * a)
            solutionstring.2 = 0.0
            solutionstring.3 = (-b) / (2 * a)
            solutionstring.4 = 0.0
        case let x where x > 0:
            solutionstring.0 = "Two Real Roots"
            let sqrtDisc = sqrt(discriminant)
            solutionstring.1 = (-b + sqrtDisc) / (2 * a)
            solutionstring.2 = 0.0
            solutionstring.3 = (-b - sqrtDisc) / (2 * a)
            solutionstring.4 = 0.0
        default:
            return solutionstring.0 = "ERROR"
        }
        
        /// This function is used to find the amount of error generated by the subtractive cancellation. As such, we take the solutions, and re-input them into the problem, trying to find the Discriminant by reverse operations.
        ///
        /// e.g. solution of X from:
        ///
        ///    -b +/- sqrt(discriminant)
        ///    ----------------------------  = X   => 2X a = -b +/- sqrtDisc  -> 2Xa + b = +/- sqrtDisc
        ///             2a
        
        if solutionstring.0 == "Two Complex Roots" {
            solvedDisc = -((solutionstring.2 * 2 * a) * (solutionstring.2 * 2 * a))
        }
        else {
            solvedDisc = -((solutionstring.1 * (2 * a)) + b) * (-((solutionstring.1 * (2 * a)) + b))
          
        }
        errormargin = discriminant - solvedDisc
    }
    
    
    }

