package com.example.domain.service;

import org.dbunit.DataSourceDatabaseTester
import org.dbunit.operation.DatabaseOperation
import org.dbunit.util.fileloader.CsvDataFileLoader
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.util.ResourceUtils
import spock.lang.Specification
import spock.lang.Unroll

import javax.sql.DataSource

import com.example.domain.service.CategoryService;

@SpringBootTest
class CategoryServiceSpec extends Specification {

    @Autowired
    CategoryService categoryService;

    @Autowired
    DataSource dataSource

    def setup() {
        def databaseTester = new DataSourceDatabaseTester(dataSource)
        databaseTester.setUpOperation = DatabaseOperation.CLEAN_INSERT

        def loader = new CsvDataFileLoader()
        databaseTester.dataSet = loader.loadDataSet(ResourceUtils.getURL("classpath:dbunit/"))

        databaseTester.onSetup()
    }

    def "category service test"() {
        expect:
        def items = categoryService.getAllItems()

        items.each {
            println 'category ID: ' + it.getCategoryId()
            println 'class ID: ' + it.getClassId()
            println 'item ID: ' + it.getItemId()
            println 'item name: ' + it.getItemName()
            println 'item property: ' + it.getItemProperty()
        }

        assert items.size() > 0
    }
}