package service;

import java.util.List;

import po.News;

public interface NewsService {
	//显示
	public List<News> newsshow();
	
	//添加
	public int newsadd(News news);
	
	//删除
	public int newsdel(int news_id);
	
	//修改
	public int newsupd(News news);
	
	//通过id获取信息
	public News getNewsById(int news_id);
}
