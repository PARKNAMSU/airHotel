package kg.air.cnc.common;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import javax.imageio.ImageIO;

public class resizeFile {

	public static String reszieFiles(String uploadPath, String path, String fileName, String mainPosition ) {
		String imgFormat = "jpg";                       
//		int newWidth = 600;                               
//		int newHeight = 400;                            
		int imageWidth;
		int imageHeight;
		double ratio;
		int w = 0;
		int h = 0;
		String resizeName = null;
		try{
			BufferedImage image = ImageIO.read(new File(uploadPath + path, fileName));
			imageWidth = image.getWidth(null);
			imageHeight = image.getHeight(null);
			if(mainPosition.equals("W")){ 
				w = 600;
				h = 400;
			}else if(mainPosition.equals("H")){ 
				w = 400;
				h = 600;
			}
			Image resizeImage = image.getScaledInstance(w, h, Image.SCALE_SMOOTH);
			BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			Graphics g = newImage.getGraphics();
			g.drawImage(resizeImage, 0, 0, null);
			g.dispose();
			resizeName = uploadPath + path + File.separator + "s_" + fileName; 
			ImageIO.write(newImage, imgFormat, new File(resizeName));
		}catch (Exception e){
			e.printStackTrace();
		}
		return resizeName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
