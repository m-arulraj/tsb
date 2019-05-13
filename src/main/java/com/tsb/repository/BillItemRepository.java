package com.tsb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tsb.domain.BillItem;

@Repository
public interface BillItemRepository extends JpaRepository<BillItem, Long> {

}
