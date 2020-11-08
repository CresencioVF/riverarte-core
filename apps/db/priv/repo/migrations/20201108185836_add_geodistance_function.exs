defmodule DB.Repo.Migrations.AddGeodistanceFunction do
  use Ecto.Migration

  def up do
    execute """
      CREATE OR REPLACE FUNCTION public.geodistance(alat double precision, alng double precision, blat double precision,
      blng double precision)
      RETURNS double precision AS
      $BODY$
      SELECT asin(
      sqrt(
        sin(radians($3-$1)/2)^2 +
        sin(radians($4-$2)/2)^2 *
        cos(radians($1)) *
        cos(radians($3))
      )
      ) * 7926.3352 AS distance;
      $BODY$
      LANGUAGE sql IMMUTABLE
      COST 100;
    """
  end

  def down do
    execute """
      drop function public.geodistance(double precision, double precision, double precision, double precision);
    """
  end
end
