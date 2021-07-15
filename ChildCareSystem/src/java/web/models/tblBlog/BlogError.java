/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblBlog;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class BlogError implements Serializable {

    private String titleLengthErr;
    private String descriptionErr;
    private String imgErr;

    public BlogError() {
    }

    public BlogError(String titleLengthErr, String descriptionErr, String imgErr) {
        this.titleLengthErr = titleLengthErr;
        this.descriptionErr = descriptionErr;
        this.imgErr = imgErr;
    }

    public String getImgErr() {
        return imgErr;
    }

    public void setImgErr(String imgErr) {
        this.imgErr = imgErr;
    }

    public String getTitleLengthErr() {
        return titleLengthErr;
    }

    public void setTitleLengthErr(String titleLengthErr) {
        this.titleLengthErr = titleLengthErr;
    }

    public String getDescriptionErr() {
        return descriptionErr;
    }

    public void setDescriptionErr(String descriptionErr) {
        this.descriptionErr = descriptionErr;
    }

}
