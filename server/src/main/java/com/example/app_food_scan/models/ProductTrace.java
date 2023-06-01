package com.example.app_food_scan.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = ProductTrace.TABLE_NAME)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductTrace {

    public static final String TABLE_NAME = "PRODUCT_TRACE";

    public static final String ID_PRODUCT_TRACE_COLUMN = "ID_PRODUCT_TRACE";
    public static final String ID_DEVICE_COLUMN = "ID_DEVICE";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = ID_PRODUCT_TRACE_COLUMN, updatable = false, nullable = false)
    private Long idProductTrace;

    @Column(name = ID_DEVICE_COLUMN)
    private String idDevice;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = Product.ID_PRODUCT_COLUMN)
    private Product product;

    @ManyToOne
    @JoinColumn(name = Allergen.ID_ALLERGEN_COLUMN)
    private Allergen trace;

}
