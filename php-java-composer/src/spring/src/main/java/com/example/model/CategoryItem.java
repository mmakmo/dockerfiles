package com.example.model;

import lombok.Getter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class CategoryItem implements Serializable {

    @Id
    @Getter
    @Column(name = "category_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer categoryId;

    @Getter
    @Column(name = "class_id", nullable = false)
    private Integer classId;

    @Getter
    @Column(name = "item_id", nullable = false)
    private Integer itemId;

//    @Getter
//    @OneToMany(mappedBy="category",targetEntity=Item.class,fetch= FetchType.EAGER)
//    private Collection<Item> items;


    @Getter
    @ManyToOne(optional=false)
    @JoinColumn(name="item_id", referencedColumnName="item_id", insertable=false, updatable=false)
    private Item item;

}