package com.lnk.controller;

import com.lnk.pojo.Foods;
import com.lnk.service.FoodsService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Jackie's PC
 */
@RestController
@RequestMapping("/api")
public class ApiFoodsController {
    @Autowired
    private FoodsService foodsService;
      @DeleteMapping("foods/{foodId}")
      @CrossOrigin
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteStores(@PathVariable(value = "foodId") int id) {
        this.foodsService.deleteFoods(id);
    }
    @RequestMapping("/foods/")
   @CrossOrigin
    public ResponseEntity<List<Foods>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.foodsService.getFoods(params), HttpStatus.OK);
    }
}