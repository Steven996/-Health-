package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MovieDao;
import po.Commodity;
import po.CommodityType;
import po.Movie;
import po.News;
@Service("movieService")
public class MovieServiceImpl implements MovieService{
@Autowired MovieDao movieDao;
	//电影操作
//小知识
	public News  getclassById(int news_id) {
		return movieDao.getclassById(news_id);
	}
	
	//添加电影
	public int addm(Commodity commodity) {
		return movieDao.addm(commodity);
	}
	
	//显示电影列表
	public List<Commodity> show(){
		List<Commodity> list = movieDao.show();
		return list;
	}
	
	//删除电影
	public int delm(int commodity_id) {
		return movieDao.delm(commodity_id);
	}
	
	//修改电影
	public int updm(Commodity commodity) {
		return movieDao.updm(commodity);
	}
	
	//通过id获取详情信息
		public Commodity getMovieById(int commodity_id){
			return movieDao.getMovieById(commodity_id);
		}
	
	//搜索
	public List<Commodity> search(String commodity_name){
		List searchlist = movieDao.search(commodity_name);
		return searchlist;
	}
	
	
								//电影分类操作
	
	//显示电影分类
	public List<CommodityType> showtype(){
		List<CommodityType> list = movieDao.showtype();
		return list;
	}
	
	//添加电影分类
	public int addtype(CommodityType commodityType) {
		return movieDao.addtype(commodityType);
	}
	
	//删除电影分类
	public int deltype(int commodity_type_id) {
		return movieDao.deltype(commodity_type_id);
	}
	
	//修改电影分类
	public int updtype(CommodityType commodityType) {
		return movieDao.updtype(commodityType);
	}
	
	//通过id获取电影分类
	public CommodityType getMovieTypeById(int commodity_type_id) {
		return movieDao.getMovieTypeById(commodity_type_id);
	}
//		//详情
//	@Override
//	public Commodity detailshow() {
//		// TODO Auto-generated method stub
//		return movieDao.detailshow();
//	}

}
