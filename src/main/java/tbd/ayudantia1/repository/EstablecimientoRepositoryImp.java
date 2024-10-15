package tbd.ayudantia1.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Sql2o;
import tbd.ayudantia1.model.Establecimiento;

@Repository
public class EstablecimientoRepositoryImp implements EstablecimientoRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public Establecimiento getEstablecimientoId(Integer establecimientocodigo) {
        try (org.sql2o.Connection con = sql2o.open()) {
            return con.createQuery("SELECT * FROM vista_establecimientos WHERE establecimientocodigo = :establecimientocodigo")
                    .addParameter("establecimientocodigo",establecimientocodigo)
                    .executeAndFetchFirst(Establecimiento.class);
        }
    }
}
