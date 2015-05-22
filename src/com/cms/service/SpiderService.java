package com.cms.service;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.stereotype.Service;

import com.cms.parser.ParserUtil;

@Service("spiderService")
public class SpiderService {
	
	public static void main(String[] args) {
		
		HttpClient httpClient = HttpClients.createDefault();
		String url = "http://localhost:8080/Net_CMS/index/";
		String html = ParserUtil.getBody(httpClient, url);
		
		ParserUtil.getImg(httpClient, html,url.substring(0, url.lastIndexOf("/")+1));
		
	}
	
}
