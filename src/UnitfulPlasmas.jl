__precompile__(true)

module UnitfulPlasmas

  import Unitful
  using Unitful: @unit

  import Unitful.DefaultSymbols

  @unit n20 "n20" PlasmaDensity 1e20/Unitful.m^3 false

  # Some gymnastics required here because if we precompile, we cannot add to
  # Unitful.basefactors at compile time and expect the changes to persist to runtime.

  const localunits = Unitful.basefactors

  function __init__()
      merge!(Unitful.basefactors, localunits)
      Unitful.register(UnitfulPlasmas)
  end

end
