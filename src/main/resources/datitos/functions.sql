create function insertar_pos_establecimientos() returns trigger
    language plpgsql
as
$$
BEGIN
    INSERT INTO pos_establecimientos (establecimientocodigo, latitud, longitud, geom)
    VALUES (
               NEW.establecimientocodigo,
               CAST(NEW.latitud AS DOUBLE PRECISION),
               CAST(NEW.longitud AS DOUBLE PRECISION),
               ST_SetSRID(ST_MakePoint(CAST(NEW.longitud AS DOUBLE PRECISION), CAST(NEW.latitud AS DOUBLE PRECISION)), 4326)
           )
    ON CONFLICT (establecimientocodigo) DO UPDATE
        SET
            latitud = EXCLUDED.latitud,
            longitud = EXCLUDED.longitud,
            geom = EXCLUDED.geom;

    RETURN NEW;
END;
$$;

alter function insertar_pos_establecimientos() owner to postgres;


create trigger trg_insertar_pos_establecimientos
    after insert or update
    on establecimientos
    for each row
execute procedure insertar_pos_establecimientos();