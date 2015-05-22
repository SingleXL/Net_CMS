package com.cms.model;

public class Article {
	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", title=" + title
				+ ", keyword=" + keyword + ", status=" + status + ", content="
				+ content + ", summary=" + summary + ", createDate="
				+ createDate + ", publishDate=" + publishDate + ", channel="
				+ channel + ", author=" + author + ", thumb=" + thumb + "]";
	}

	private Integer articleId;
	private String title;
	private String keyword;
	private int status;
	private String content;
	private String summary;
	private String createDate;
	private String publishDate;
	private String channel;
	private String author;
	private String thumb;
	private String asn;

	public String getAsn() {
		return asn;
	}

	public void setAsn(String asn) {
		this.asn = asn;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getThumb() {
		return thumb;
	}

}
