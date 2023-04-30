package com.model2.mvc.web.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/api/products/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("${pageUnit}")
	int pageUnit;
	
	@Value("${pageSize}")
	int pageSize;
	
	///Constructor
	public ProductRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("getProduct/{prodNo}")
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		return productService.getProduct(prodNo);
	} 
	
	@RequestMapping("listProduct")
	public List<Product> listProduct(@RequestBody Search search	) throws Exception {
		
		search.setPageSize(pageSize);
		
		
		Map<String,Object> map = productService.getProductList(search);
		
		// Business logic 수행
		return (List<Product>)map.get("list");
	} 
	
	@RequestMapping("getProductNameList")
	public List<String> getProductNameList() throws Exception {
		return productService.getProductNameList();
	}

}
