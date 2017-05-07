package com.example.domain.model;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;

@RequiredArgsConstructor
public class CategoryItem implements Serializable {

    @Getter
    private final int categoryId;

    @Getter
    private final int classId;

    @Getter
    private final int itemId;

    @Getter
    private final String itemName;

    @Getter
    private final String itemProperty;

}