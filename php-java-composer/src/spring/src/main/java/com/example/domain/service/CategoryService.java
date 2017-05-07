package com.example.domain.service;

import com.example.domain.table.Category;
import com.example.domain.table.Category_;
import com.example.domain.table.ItemAttr_;
import com.example.domain.table.Item_;
import com.example.domain.model.CategoryItem;
import com.example.domain.repository.CategoryRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.apache.commons.lang3.StringUtils;


@Service
public class CategoryService {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    CategoryRepository categoryRepository;

    public List<CategoryItem> getAllItems() {
        return this.getCategories(null, null, null);
    }
    public List<CategoryItem> getCategories(Integer categoryId, Integer classId, String itemName) {
        final CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        final CriteriaQuery <Category> query = builder.createQuery(Category.class);
        final Root <Category> root = query.from(Category.class);

        // JOIN
        root
            .fetch(Category_.item, JoinType.LEFT)
            .fetch(Item_.itemAttr, JoinType.INNER);

        // WHARE
        final List<Predicate> where = new ArrayList<>();
        if (!Objects.isNull(categoryId)) {
            where.add(builder.equal(root.get(Category_.categoryId), categoryId));
        }
        if (!Objects.isNull(classId)) {
            where.add(builder.equal(root.get(Category_.classId), classId));
        }
        if (StringUtils.isNotEmpty(itemName)) {
            where.add(builder.like(root.get(Category_.item).get(Item_.itemName), "%" + itemName + "%"));
        }
        if (where.size() > 0) {
            query.where(where.toArray(new Predicate[where.size()]));
        }

        // ORDER BY
        query.orderBy(
            builder.desc(root.get(Category_.item).get(Item_.itemName)),
            builder.asc(root.get(Category_.classId))
        );

        // Execute SQL
        final List<Category> sqlResult = entityManager.createQuery(query).getResultList();

        final List<CategoryItem> result = new ArrayList<>();
        sqlResult.stream()
            .forEach(
                category -> result.add(
                    new CategoryItem(category.getCategoryId(),
                                        category.getClassId(),
                                        category.getItemId(),
                                        category.getItem().getItemName(),
                                        category.getItem().getItemAttr().getItemProperty())
                )
            );

        return result;
    }

}