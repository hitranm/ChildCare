/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.viewModels.Blog;

import web.models.tblBlog.BlogDTO;

/**
 *
 * @author HOANGKHOI
 */
public class BlogViewModel {
    private BlogDTO blogDTO;
    private String authorName;

    public BlogViewModel() {
    }

    public BlogViewModel(BlogDTO blogDTO, String authorName) {
        this.blogDTO = blogDTO;
        this.authorName = authorName;
    }

    public BlogDTO getBlogDTO() {
        return blogDTO;
    }

    public void setBlogDTO(BlogDTO blogDTO) {
        this.blogDTO = blogDTO;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }
    
    
}
