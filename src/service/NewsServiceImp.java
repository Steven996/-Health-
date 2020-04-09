package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NewsDao;
import po.News;
@Service("newsService")
public class NewsServiceImp implements NewsService{
@Autowired NewsDao newsDao;
	@Override
	public List<News> newsshow() {
		
		return newsDao.newsshow();
	}

	@Override
	public int newsadd(News news) {
		// TODO Auto-generated method stub
		return newsDao.newsadd(news);
	}

	@Override
	public int newsdel(int news_id) {
		// TODO Auto-generated method stub
		return newsDao.newsdel(news_id);
	}

	@Override
	public int newsupd(News news) {
		// TODO Auto-generated method stub
		return newsDao.newsupd(news);
	}

	@Override
	public News getNewsById(int news_id) {
		// TODO Auto-generated method stub
		return newsDao.getNewsById(news_id);
	}
	//≤È—Ø
	public List newssearch(@Param(value="news_title")String news_title) {
		return newsDao.newssearch(news_title);
	}
	
}
