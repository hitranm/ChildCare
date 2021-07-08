/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblService;

import java.io.Serializable;

/**
 *
 * @author HOANGKHOI
 */
public class CreateServiceError implements Serializable{
    private String priceFormat;
    private String salePriceFormat;
    private String titleLengthError;
    private String descriptionLengthError;
    private String imageError;

    public CreateServiceError() {
    }

    public CreateServiceError(String priceFormat, String salePriceFormat, String titleLengthError, String descriptionLengthError, String imageError) {
        this.priceFormat = priceFormat;
        this.salePriceFormat = salePriceFormat;
        this.titleLengthError = titleLengthError;
        this.descriptionLengthError = descriptionLengthError;
        this.imageError = imageError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getPriceFormat() {
        return priceFormat;
    }

    public void setPriceFormat(String priceFormat) {
        this.priceFormat = priceFormat;
    }

    public String getSalePriceFormat() {
        return salePriceFormat;
    }

    public void setSalePriceFormat(String salePriceFormat) {
        this.salePriceFormat = salePriceFormat;
    }

   
    public String getTitleLengthError() {
        return titleLengthError;
    }

    public void setTitleLengthError(String titleLengthError) {
        this.titleLengthError = titleLengthError;
    }

    public String getDescriptionLengthError() {
        return descriptionLengthError;
    }

    public void setDescriptionLengthError(String descriptionLengthError) {
        this.descriptionLengthError = descriptionLengthError;
    }
    
    
}
