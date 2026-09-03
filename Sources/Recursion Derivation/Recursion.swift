import Either
import Product

@attached(member, names: arbitrary)
public macro Recursion() = #externalMacro(
    module: "Recursion_Derivation_Macros",
    type: "Macro"
)
