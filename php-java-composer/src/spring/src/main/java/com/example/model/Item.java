package com.example.model;

import lombok.Getter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

@Entity
public class Item implements Serializable {

    @Id
    @Getter
    @Column(name = "item_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long itemId;

    @Getter
    @Column(nullable = false)
    private String itemName;

//    @ManyToOne(optional=false)
//    @JoinColumn(name="item_id", referencedColumnName="item_id", insertable=false, updatable=false)
//    private Category category;



    @Getter
    @OneToMany(mappedBy="item",targetEntity=Category.class, fetch=FetchType.EAGER)
    private Collection<Category> categories;

}