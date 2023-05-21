/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class GuideTour {
    private int guideId;
    private String guideName;
    private int guideAge;
    private String guideImage;
    private String guideEmail;
    private String guidePhone;

    public GuideTour() {
    }

    public GuideTour(int guideId, String guideName, int guideAge, String guideImage, String guideEmail, String guidePhone) {
        this.guideId = guideId;
        this.guideName = guideName;
        this.guideAge = guideAge;
        this.guideImage = guideImage;
        this.guideEmail = guideEmail;
        this.guidePhone = guidePhone;
    }

    public int getGuideId() {
        return guideId;
    }

    public void setGuideId(int guideId) {
        this.guideId = guideId;
    }

    public String getGuideName() {
        return guideName;
    }

    public void setGuideName(String guideName) {
        this.guideName = guideName;
    }

    public int getGuideAge() {
        return guideAge;
    }

    public void setGuideAge(int guideAge) {
        this.guideAge = guideAge;
    }

    public String getGuideImage() {
        return guideImage;
    }

    public void setGuideImage(String guideImage) {
        this.guideImage = guideImage;
    }

    public String getGuideEmail() {
        return guideEmail;
    }

    public void setGuideEmail(String guideEmail) {
        this.guideEmail = guideEmail;
    }

    public String getGuidePhone() {
        return guidePhone;
    }

    public void setGuidePhone(String guidePhone) {
        this.guidePhone = guidePhone;
    }

    @Override
    public String toString() {
        return "GuideTour{" + "guideId=" + guideId + ", guideName=" + guideName + ", guideAge=" + guideAge + ", guideImage=" + guideImage + ", guideEmail=" + guideEmail + ", guidePhone=" + guidePhone + '}';
    }
    
    
}
