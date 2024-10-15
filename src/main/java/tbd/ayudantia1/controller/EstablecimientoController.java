package tbd.ayudantia1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import tbd.ayudantia1.model.Establecimiento;
import tbd.ayudantia1.service.EstablecimientoService;

@RestController
public class EstablecimientoController {

    @Autowired
    private EstablecimientoService establecimientoService;

    @GetMapping("/establecimientos/{id}")
    public ResponseEntity<Establecimiento> getEstablecimiento(@PathVariable Integer id) {
        Establecimiento establecimiento = establecimientoService.getEstablecimientoById(id);

        if (establecimiento != null) {
            return ResponseEntity.ok(establecimiento);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}