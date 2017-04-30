package com.example;

import com.example.model.Category;
import com.example.model.Item;
import com.example.repository.CategoryRepository;
import com.example.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@EnableAutoConfiguration
public class DemoController {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    ItemRepository itemRepository;


    @RequestMapping("/")
    @ResponseBody
    public List<Category> home(){
        return categoryRepository.findAll();
    }

    @RequestMapping("/item/")
    @ResponseBody
    public List<Item> getItem(){
        return itemRepository.findAll();
    }

}