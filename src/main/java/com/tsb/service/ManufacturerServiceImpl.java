package com.tsb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tsb.domain.Manufacturer;
import com.tsb.repository.ManufacturerRepository;

@Service
public class ManufacturerServiceImpl implements ManufacturerService {

	@Autowired
	ManufacturerRepository repo;

	public List<Manufacturer> getAllManufacturer() {
		return repo.findAll();
	}

	@Override
	public Manufacturer saveManufacturer(Manufacturer manu) {
		return repo.save(manu);
	}

	@Override
	public Manufacturer getManufacturer(Long manufacturerId) {
		return repo.findById(manufacturerId).get();
	}

	@Override
	public void deleteManufacturer(Long manufacturerId) {
		repo.delete(repo.findById(manufacturerId).get());

	}

}
