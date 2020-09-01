package kg.air.cnc.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class uploadFileUtils {
	private static final Logger logger = LoggerFactory.getLogger(uploadFileUtils.class);

	// 필요한 것 세가지 : uploadPath, originalName, byte[](file data)
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		String mainPosition;
		String savedName = uid.toString() + "_" + originalName;
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		// 사이즈를 알아보기 위해 작성함, 600 * 400 으로 되야 잘 나옴
		BufferedImage bi = ImageIO.read(target);
		//logger.debug("weight : " + bi.getWidth() + ":" + "heiglt : " + bi.getHeight()); // 가로 세로 구하기.
		mainPosition = bi.getWidth() - bi.getHeight() > 0 ? "W" : "H";
		String uploadedFileName = resizeFile.reszieFiles(uploadPath, savedPath, savedName, mainPosition);
		//String uploadedFileName = makeThumnail(uploadPath, savedPath, savedName); 
		// 썸네일로 만들어서 저장을 하고 게시판에 뿌리니 화질이 너무떨어짐. 원본 그대로 해야함
		//String uploadedFileName = uploadPath+ savedPath+ "\\" + savedName; 이거는 원본파일 그대로 저장하는 방법
		//logger.info("uploadname : " + uploadedFileName.substring(uploadPath.length()).replace(File.separatorChar, '/'));
		return uploadedFileName;
	}
	// making folder
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance(); // 현재 날짜 정보
		String yearPath = File.separator + cal.get(Calendar.YEAR); // \ + 년도
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		// monthPaths
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		// 총 3개의 폴더 외곽 을 생성
		makeDir(uploadPath, yearPath, monthPath, datePath);
		//logger.info("month" + monthPath);
		//logger.info(datePath); // 최종 경로
		return datePath;
	}
	// folder 만들기
	private static void makeDir(String uploadPath, String...paths) {
		if(new File(uploadPath + paths[paths.length-1]).exists())
			return; // 제일 마지막 경로까지 해서 폴더가 존재하면 생성하지 않음

		for (String path:paths) {
			File dirPath = new File(uploadPath + path);
			// 년 > 월 > 일 순으로 경로를 생성하기 위함, 따라서 중간에 같은 년, 같은 월이 존재하면 만들지 않는다.
			//logger.info(path);
			if(!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}

	private static String makeThumnail(String uploadPath, String path, String fileName) throws Exception{
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName)); // 경로상에 있는 파일을 읽어온단
		BufferedImage destImg = Scalr.resize(sourceImg, 400, 600); // 이미지 압축인데 사이즈 지정해줌, 과연 될지?
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;  // thumbnail 이름엔 s_가 붙는다.
		//logger.info("thum :" + thumbnailName);
		File newFile = new File(thumbnailName);  // thunmbnail 경로로 새 파일 작성
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		// format을 뽑는 애인듯
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
