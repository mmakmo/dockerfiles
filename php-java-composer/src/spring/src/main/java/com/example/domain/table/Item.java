package com.example.domain.table;

import lombok.Getter;

import javax.persistence.*;
import java.io.Serializable;;

@Entity
public class Item implements Serializable {

    @Id
    @Getter
    @Column(name = "item_id", nullable = false)
    private int itemId;

    @Getter
    @Column(name = "item_name",nullable = false)
    private String itemName;

    @Getter
    @OneToOne(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
    @JoinColumn(name="item_id", referencedColumnName="item_id", insertable=false, updatable=false)
    private ItemAttr itemAttr;

}