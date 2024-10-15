create database cambiarnombre;
create extension postgis;


create table if not exists establecimientos
(
    establecimientocodigo                   integer,
    establecimientoglosa                    text,
    establecimientocodigoantiguo            text,
    establecimientocodigomadreantiguo       text,
    establecimientocodigomadrenuevo         double precision,
    regioncodigo                            integer,
    regionglosa                             text,
    seremisaludcodigo_serviciodesaludcodigo double precision,
    seremisaludglosa_serviciodesaludglosa   text,
    tipopertenenciaestabglosa               text,
    tipoestablecimientoglosa                text,
    ambitofuncionamiento                    text,
    certificacion                           text,
    dependenciaadministrativa               text,
    nivelatencionestabglosa                 text,
    comunacodigo                            text,
    comunaglosa                             text,
    tipoviaglosa                            text,
    numero                                  text,
    nombrevia                               text,
    telefonomovil_telefonofijo              text,
    fechainiciofuncionamientoestab          text,
    tieneserviciourgencia                   text,
    tipourgencia                            text,
    clasificaciontiposapu                   text,
    latitud                                 text,
    longitud                                text,
    tiposistemasaludglosa                   text,
    estadofuncionamiento                    text,
    nivelcomplejidadestabglosa              text,
    tipoatencionestabglosa                  text,
    fechaincorporacion                      text
);

alter table establecimientos
    owner to postgres;

create table if not exists pos_establecimientos
(
    establecimientocodigo integer not null primary key,
    latitud               double precision,
    longitud              double precision,
    geom                  geometry(Point, 4326)
);

alter table pos_establecimientos
    owner to postgres;

create view vista_establecimientos (establecimientocodigo, establecimientoglosa, regionglosa, latitud, longitud, pos) as
SELECT e.establecimientocodigo,
       e.establecimientoglosa,
       e.regionglosa,
       pe.latitud,
       pe.longitud,
       pe.geom AS pos
FROM establecimientos e
         LEFT JOIN pos_establecimientos pe ON e.establecimientocodigo = pe.establecimientocodigo;

alter table vista_establecimientos
    owner to postgres;

