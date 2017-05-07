package com.example.domain.table;

import lombok.Getter;

import javax.persistence.*;
import java.io.Serializable;;

@Entity
public class ItemAttr implements Serializable {

    @Id
    @Getter
    @Column(name = "item_id", nullable = false)
    private int itemId;

    @Getter
    @Column(name = "item_property",nullable = false)
    private String itemProperty;

}