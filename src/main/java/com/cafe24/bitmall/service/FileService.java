package com.cafe24.bitmall.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {
    private static final String SAVE_THUMB_PATH = "/Cafe24/4_workspace/bitmall/product-imgs/thumb";
    private static final String SAVE_DETAIL_PATH = "/Cafe24/4_workspace/bitmall/product-imgs/detail";
    private static final String PREFIX_THUMB_URL = "/product/images/thumb/";
    private static final String PREFIX_DETAIL_URL = "/product/images/detail/";

    public void remove( Integer sw, String fileName ) {
	if ( "".equals( fileName ) ) {
	    return ;
	}

	try {
	    String savedFileName = fileName.substring( fileName.lastIndexOf( '/' ) + 1, fileName.length() );
	    if ( sw != 0 ) {
		deleteFile( SAVE_DETAIL_PATH, savedFileName );
		return ;
	    }
	    deleteFile( SAVE_THUMB_PATH, savedFileName );
	} catch ( IOException e ) {
	    throw new RuntimeException( e );
	}
    }

    public String restore( Integer sw, MultipartFile multipartFile ) {
	String url = "";

	if ( multipartFile == null || "".equals( multipartFile.getOriginalFilename() ) ) {
	    return url;
	}

	try {
	    String originFileName = multipartFile.getOriginalFilename();
	    String extName = originFileName.substring( originFileName.lastIndexOf( "." ), originFileName.length() );
	    String saveFileName = genSaveFileName( extName );
	    if ( sw != 0 ) {
		writeFile( multipartFile, SAVE_DETAIL_PATH, saveFileName );
		url = PREFIX_DETAIL_URL + saveFileName;
		return url;
	    }
	    writeFile( multipartFile, SAVE_THUMB_PATH, saveFileName );
	    url = PREFIX_THUMB_URL + saveFileName;
	} catch ( IOException ex ) {
	    throw new RuntimeException( ex );
	}
	return url;
    }

    private void writeFile( MultipartFile multipartFile, String savePath, String saveFileName ) throws IOException {
	File saveDirectory = new File( savePath );
	if ( !saveDirectory.exists() ) {
	    saveDirectory.mkdirs();
	}

	byte[] fileData = multipartFile.getBytes();
	FileOutputStream fos = new FileOutputStream( savePath + "/" + saveFileName );
	fos.write( fileData );
	fos.close();
    }

    private void deleteFile( String savePath, String fileName ) throws IOException {
	File imageFile = new File( savePath + "/" + fileName );
	System.out.println( "11delete: " + fileName );
	if ( imageFile.exists() ) {
	    System.out.println( "22delete: " + fileName );
	    imageFile.delete();
	}
    }

    private String genSaveFileName( String extName ) {
	String filename = "";

	Calendar calendar = Calendar.getInstance();
	filename += calendar.get( Calendar.YEAR );
	filename += calendar.get( Calendar.MONTH );
	filename += calendar.get( Calendar.DATE );
	filename += calendar.get( Calendar.HOUR );
	filename += calendar.get( Calendar.MINUTE );
	filename += calendar.get( Calendar.SECOND );
	filename += calendar.get( Calendar.MILLISECOND );
	filename += extName;

	return filename;
    }
}
