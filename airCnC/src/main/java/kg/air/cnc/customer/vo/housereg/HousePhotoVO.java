package kg.air.cnc.customer.vo.housereg;

import org.springframework.web.multipart.MultipartFile;

public class HousePhotoVO {
	private MultipartFile uploadFiles;

	public MultipartFile getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadedFiles(MultipartFile uploadFiles) {
		this.uploadFiles = uploadFiles;
	}
	
}
