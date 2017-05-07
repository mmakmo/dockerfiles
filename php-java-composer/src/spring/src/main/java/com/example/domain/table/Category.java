package com.example.domain.table;

import lombok.Getter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@IdClass(CategoryKeys.class)
public class Category implements Serializable {

    @Id
    @Getter
    @Column(name = "category_id", nullable = false)
    private int categoryId;

    @Id
    @Getter
    @Column(name = "class_id", nullable = false)
    private int classId;

    @Getter
    @Column(name = "item_id", nullable = false)
    private int itemId;

    @Getter
    @ManyToOne(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
    @JoinColumn(name="item_id", referencedColumnName="item_id", insertable=false, updatable=false)
    private Item item;

}