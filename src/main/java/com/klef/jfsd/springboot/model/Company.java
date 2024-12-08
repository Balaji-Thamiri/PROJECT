package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name="company_table")
public class Company 
{
	    @Id
	    @Column(name = "name", nullable = false, unique = true, length = 100)
	    private String Name;
	    @Column(name = "email", nullable = false, unique = true, length = 100)
	    private String Email;
	    @Column(name = "phone", nullable = false, length = 15)
	    private String Phone;
	    @Column(name = "location", nullable = false, length = 50)
	    private String Location;
	    @Column(name = "website", nullable = false, length = 50)
	    private String Website;
	    @Column(name = "password", nullable = false, length = 50)
	    private String password;
	    
	    @Lob
	    @Column(name = "profile_image")
	    private byte[] profileImage;  // Stores the image as bytes

	    @Lob  // Changed to @Lob to allow for larger base64 image data
	    @Column(name = "base64_image", columnDefinition = "LONGTEXT") // Changed to LONGTEXT
	    private String base64Image;  // Stores the Base64 encoded image for easy display

	    @Column(name = "image_type", length = 50)
	    private String imageType;  // Stores the type of the image (e.g., image/png)
        
	    @Column(name="status",nullable=false,length = 50)
	    private String status;
	  
	    
		public String getName() {
			return Name;
		}

		public void setName(String name) {
			Name = name;
		}

		public String getEmail() {
			return Email;
		}

		public void setEmail(String email) {
			Email = email;
		}

		public String getPhone() {
			return Phone;
		}

		public void setPhone(String phone) {
			Phone = phone;
		}

		public String getLocation() {
			return Location;
		}

		public void setLocation(String location) {
			Location = location;
		}

		public String getWebsite() {
			return Website;
		}

		public void setWebsite(String website) {
			Website = website;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public byte[] getProfileImage() {
			return profileImage;
		}

		public void setProfileImage(byte[] profileImage) {
			this.profileImage = profileImage;
		}

		public String getBase64Image() {
			return base64Image;
		}

		public void setBase64Image(String base64Image) {
			this.base64Image = base64Image;
		}

		public String getImageType() {
			return imageType;
		}

		public void setImageType(String imageType) {
			this.imageType = imageType;
		}
		 public String getStatus() {
		    	return status;
		    }
		     public void setStatus(String status) {
		    	this.status = status;
		    }
}
