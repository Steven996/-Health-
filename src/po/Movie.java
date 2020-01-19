package po;

public class Movie {
	private int movie_id;
	private String moviename;
	private int hits;
	private String picture;
	private String detail;
	private int movietype;
	private int typ_id;
	private String typeName;
	private String date;
	private String video;
	
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTyp_id() {
		return typ_id;
	}
	public void setTyp_id(int typ_id) {
		this.typ_id = typ_id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getMovietype() {
		return movietype;
	}
	public void setMovietype(int movietype) {
		this.movietype = movietype;
	}
	public String toString() {
		return "Movie [movie_id="+movie_id+",moviename="+moviename+",typ_id="+typ_id+",hits="+hits+","
				+ "movietype="+movietype+",picture="+picture+",video="+video+"]";
	}
}
