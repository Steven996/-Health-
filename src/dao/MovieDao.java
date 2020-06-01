package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import po.Commodity;
import po.CommodityType;
import po.Movie;
import po.News;
import po.User;

public interface MovieDao {
				
								//商品操作
	
	//显示电影列表
	public List<Commodity> show();

//	//添加电影
	public int addm(Commodity commodity);
	
	//删除电影
	public int delm(int commodity_id);
	
	//修改电影
	public int updm(Commodity commodity);
	
	//通过id获取详情信息
	public Commodity getMovieById(int commodity_id);
	
	//搜索
	public List moviesearch(@Param(value="commodity_name")String commodity_name);
	
	//获取视频
//	public List<Movie> getVideo();
							//分类操作
	
	//显示电影分类
	public List<CommodityType> showtype();
	
	//添加电影分类
	public int addtype(CommodityType commodityType);
	
	//删除电影分类
	public int deltype(int commodity_type_id);
	
	//修改电影分类
	public int updtype(CommodityType commodityType);
	
	//通过id获取电影分类
	public CommodityType getMovieTypeById(int commodity_type_id);
	//小知识
	public News  getclassById(int news_id);
}
