package com.example.controller;

import com.example.domain.model.CategoryItem;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import com.example.domain.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@Api(tags = { "Category API" })
@RequestMapping("/api/v1")
@RestController
@EnableAutoConfiguration
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @ApiOperation(
        value = "Get All Items Detail",
        notes = "Get all detailed items."
    )
    @RequestMapping(value = "/items", method = RequestMethod.GET)
    @ResponseBody
    public List<CategoryItem> getAllItems(){
        return categoryService.getAllItems();
    }

    @ApiOperation(
        value = "Get Items Detail",
        notes = "Get items detail filtering category ID, class ID and item name."
    )
    @RequestMapping(value = "/categories/{categoryId}/{classId}/{itemName}", method = RequestMethod.GET)
    @ResponseBody
    public List<CategoryItem> getCategories(@PathVariable Integer categoryId,
                                            @PathVariable Integer classId,
                                            @PathVariable String itemName){
        return categoryService.getCategories(categoryId, classId, itemName);
    }

}