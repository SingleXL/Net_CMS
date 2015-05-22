package com.cms.parser;

import java.io.InputStream;
import java.nio.charset.Charset;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.entity.ContentType;
import org.htmlparser.Parser;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.util.NodeList;

public class ParserUtil {

	public static String getBody(HttpClient httpClient, String url) {
		try {
			HttpGet get = new HttpGet(url);
			HttpResponse response = httpClient.execute(get);
			HttpEntity entity = response.getEntity();

			if (entity != null) {
				InputStream in = entity.getContent();

				String charset = getCharset(entity);
				String html = IOUtils.toString(in, charset);
				if (!charset.equals("UTF-8")) {
					html = new String(html.getBytes(), "UTF-8");
				}

				get.releaseConnection();
				return html;
			} else {
				return "";
			}
		} catch (Exception e) {
		}
		return "";
	}

	private static String getCharset(HttpEntity entity) {
		String contentCharset = "UTF-8";

		Charset charset = ContentType.getOrDefault(entity).getCharset();
		if (charset != null) {
			contentCharset = charset.displayName();
		}
		return contentCharset;
	}

	public static InputStream getImg(HttpClient client, String html,
			String context) {
		
		try {
			// 创建一个HTML解释器
			Parser parser = new Parser();
			parser.setInputHTML(html);

			NodeList imgTags = parser
					.parse(new NodeClassFilter(ImageTag.class));
			for (int i = 0; i < imgTags.size(); i++) {

				ImageTag it = (ImageTag) imgTags.elementAt(i);
				String imgUrl = it.getImageURL();
				
				if (!imgUrl.contains("http")) {
					imgUrl = context + imgUrl;
					imgUrl = imgUrl.replace("////", "//");
				}
				
				System.out.println(imgUrl);
			}

		} catch (Exception e) {
		}
		return null;
	}

}
