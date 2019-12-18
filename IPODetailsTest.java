package com.cognizant.stockmarket;

import static org.junit.Assert.*;
import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.Before;

import com.cognizant.stockmarket.controller.IPOController;
import com.cognizant.stockmarket.entity.Company;
import com.cognizant.stockmarket.entity.IPODetails;
import com.cognizant.stockmarket.entity.Sectors;
import com.cognizant.stockmarket.entity.StockExchange;

class IPODetailsTest {

	IPODetails ipo1 = null;
	IPODetails ipo2 = null;
	IPODetails ipo3 = null;
	IPOController ipoController;

	@Before
	void setUp() throws Exception {

		ipoController = mock(IPOController.class);
		Sectors s1 = new Sectors(1l, "BFS", "IT");
		Sectors s2 = new Sectors(2l, "BS", "IT1");
		Company c1 = new Company(255, "Cognizant", 22000, "Brian", "ABC", true, s1, "abcd", "1234", false);
		Company c2 = new Company(255, "Cogni", 21000, "Brian", "ABC", true, s2, "abcd", "1234", false);
		StockExchange se1 = new StockExchange(1, "BSE", "Bombay Stock EXchange", "Mumbai", "Good");
		StockExchange se2 = new StockExchange(2, "NSE", "National Stock EXchange", "Mumbai", "Good");

		ipo1 = new IPODetails(1, c1, se1, 200, 15000, "GOOD");
		ipo2 = new IPODetails(2, c2, se2, 300, 16000, "V. GOOD");
		ipo3 = new IPODetails(3, c2, se2, 400, 16000, "V. GOOD");

		when(ipoController.addNewIPO(ipo3)).thenReturn(Arrays.asList(ipo1, ipo2, ipo3));
	}

	@Test
	public final void testAddIPO() {
		List<IPODetails> ipo = ipoController.addNewIPO(ipo3);
		assertEquals(3, ipo.size());
	}

	@Test
	void testGetIPO() {
		fail("Not yet implemented");
	}

	@Test
	void testGetIPOById() {
		fail("Not yet implemented");
	}

}
