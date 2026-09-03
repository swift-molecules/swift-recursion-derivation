import Anamorphism_Derivation_Core
import Apomorphism_Derivation_Core
import Catamorphism_Derivation_Core
import Chronomorphism_Derivation_Core
import Hylomorphism_Derivation_Core
import Paramorphism_Derivation_Core
public import SwiftSyntax
import Zygomorphism_Derivation_Core

public enum Derivation {
    public static func expansion(of declaration: EnumDeclSyntax) -> [DeclSyntax] {
        var declarations = Chronomorphism_Derivation_Core.Derivation.expansion(of: declaration)
        declarations += Catamorphism_Derivation_Core.Derivation.operation(of: declaration)
        declarations += Anamorphism_Derivation_Core.Derivation.operation(of: declaration)
        declarations += Paramorphism_Derivation_Core.Derivation.operation(of: declaration)
        declarations += Apomorphism_Derivation_Core.Derivation.operation(of: declaration)
        declarations += Zygomorphism_Derivation_Core.Derivation.operation(of: declaration)
        declarations += Hylomorphism_Derivation_Core.Derivation.operation(of: declaration)
        return declarations
    }
}
