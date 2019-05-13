package com.tsb.service;

import java.util.List;

import com.tsb.domain.Manufacturer;

public interface ManufacturerService {

	public List<Manufacturer> getAllManufacturer();

	public Manufacturer saveManufacturer(Manufacturer manu);

	public Manufacturer getManufacturer(Long manufacturerId);

	public void deleteManufacturer(Long manufacturerId);

}
