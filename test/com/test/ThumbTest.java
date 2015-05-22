package com.test;

import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

import org.junit.Test;


public class ThumbTest {
	
	@Test
	public  void test1() throws IOException{
		String path = "C:\\Users\\XL\\Desktop\\test\\";
		
		Thumbnails.of(path + "1.jpg").size(140, 120).keepAspectRatio(false).
			toFile(path + "1_1.jpg");;
		
	}
	
	
}
