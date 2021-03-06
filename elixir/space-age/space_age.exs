defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @orbital_period %{:mercury => 0.2408467,
                    :venus => 0.61519726,
                    :earth => 1.0,
                    :mars => 1.8808158,
                    :jupiter => 11.862615,
                    :saturn => 29.447498,
                    :neptune => 164.79132,
                    :uranus => 84.016846}

  @earth_day 365.25

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / (Map.get(@orbital_period, planet) * @earth_day * 24.0 * 60.0 * 60.0)
  end
end
