package tbd.ayudantia1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tbd.ayudantia1.model.Establecimiento;
import tbd.ayudantia1.repository.EstablecimientoRepository;

@Service
public class EstablecimientoService {

    @Autowired
    private EstablecimientoRepository establecimientoRepository;

    public Establecimiento getEstablecimientoById(Integer id) {
        return establecimientoRepository.getEstablecimientoId(id);
    }
}
