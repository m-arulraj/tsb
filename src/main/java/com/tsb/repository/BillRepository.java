package com.tsb.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.tsb.domain.Bill;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {

	@Modifying
    @Transactional
	@Query(value = " delete from tsb_bill_items where billid= :billId", nativeQuery = true)
	public void deleteItemsByBillId(String billId);

}
