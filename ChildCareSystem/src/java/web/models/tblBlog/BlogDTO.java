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
public class BlogDTO implements Serializable{
    private String BlogID;
    private String Thumbnail;
    private String title;
    private String AuthorID;
    private String Description;
    private String CategotyID;
    private String createdDate;
    private String updateDate;
    private String StatusID;

    public BlogDTO() {
    }

    public BlogDTO(String BlogID, String Thumbnail, String title, String AuthorID, String Description, String CategotyID, String createdDate, String updateDate, String StatusID) {
        this.BlogID = BlogID;
        this.Thumbnail = Thumbnail;
        this.title = title;
        this.AuthorID = AuthorID;
        this.Description = Description;
        this.CategotyID = CategotyID;
        this.createdDate = createdDate;
        this.updateDate = updateDate;
        this.StatusID = StatusID;
    }

    public BlogDTO(String BlogID, String Thumbnail, String title, String AuthorID, String Description, String CategotyID, String StatusID) {
        this.BlogID = BlogID;
        this.Thumbnail = Thumbnail;
        this.title = title;
        this.AuthorID = AuthorID;
        this.Description = Description;
        this.CategotyID = CategotyID;
        this.StatusID = StatusID;
    }
    /**
     * @return the BlogID
     */
    public String getBlogID() {
        return BlogID;
    }

    /**
     * @param BlogID the BlogID to set
     */
    public void setBlogID(String BlogID) {
        this.BlogID = BlogID;
    }

    /**
     * @return the Thumbnail
     */
    public String getThumbnail() {
        return Thumbnail;
    }

    /**
     * @param Thumbnail the Thumbnail to set
     */
    public void setThumbnail(String Thumbnail) {
        this.Thumbnail = Thumbnail;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the AuthorID
     */
    public String getAuthorID() {
        return AuthorID;
    }

    /**
     * @param AuthorID the AuthorID to set
     */
    public void setAuthorID(String AuthorID) {
        this.AuthorID = AuthorID;
    }

    /**
     * @return the Description
     */
    public String getDescription() {
        return Description;
    }

    /**
     * @param Description the Description to set
     */
    public void setDescription(String Description) {
        this.Description = Description;
    }

    /**
     * @return the CategotyID
     */
    public String getCategotyID() {
        return CategotyID;
    }

    /**
     * @param CategotyID the CategotyID to set
     */
    public void setCategotyID(String CategotyID) {
        this.CategotyID = CategotyID;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * @return the StatusID
     */
    public String getStatusID() {
        return StatusID;
    }

    /**
     * @param StatusID the StatusID to set
     */
    public void setStatusID(String StatusID) {
        this.StatusID = StatusID;
    }
    
}
