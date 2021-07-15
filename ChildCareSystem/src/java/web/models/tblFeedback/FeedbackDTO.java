/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblFeedback;

import java.io.Serializable;

/**
 *
 * @author HOANGKHOI
 */
public class FeedbackDTO implements Serializable {

    private int feedbackId;
    private int serviceId;
    private int customerId;
    private int reservationId;
    private String comment;
    private int rate;

    public FeedbackDTO() {
    }

    public FeedbackDTO(int feedbackId, int serviceId, int customerId, int reservationId, String comment, int rate) {
        this.feedbackId = feedbackId;
        this.serviceId = serviceId;
        this.customerId = customerId;
        this.reservationId = reservationId;
        this.comment = comment;
        this.rate = rate;
    }

    public FeedbackDTO(int serviceId, int customerId, int reservationId, String comment, int rate) {
        this.serviceId = serviceId;
        this.customerId = customerId;
        this.reservationId = reservationId;
        this.comment = comment;
        this.rate = rate;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

}
