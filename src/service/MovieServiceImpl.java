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
	//��Ӱ����
//С֪ʶ
	public News  getclassById(int news_id) {
		return movieDao.getclassById(news_id);
	}
	
	//��ӵ�Ӱ
	public int addm(Commodity commodity) {
		return movieDao.addm(commodity);
	}
	
	//��ʾ��Ӱ�б�
	public List<Commodity> show(){
		List<Commodity> list = movieDao.show();
		return list;
	}
	
	//ɾ����Ӱ
	public int delm(int commodity_id) {
		return movieDao.delm(commodity_id);
	}
	
	//�޸ĵ�Ӱ
	public int updm(Commodity commodity) {
		return movieDao.updm(commodity);
	}
	
	//ͨ��id��ȡ������Ϣ
		public Commodity getMovieById(int commodity_id){
			return movieDao.getMovieById(commodity_id);
		}
	
	//����
	public List<Commodity> search(String commodity_name){
		List searchlist = movieDao.search(commodity_name);
		return searchlist;
	}
	
	
								//��Ӱ�������
	
	//��ʾ��Ӱ����
	public List<CommodityType> showtype(){
		List<CommodityType> list = movieDao.showtype();
		return list;
	}
	
	//��ӵ�Ӱ����
	public int addtype(CommodityType commodityType) {
		return movieDao.addtype(commodityType);
	}
	
	//ɾ����Ӱ����
	public int deltype(int commodity_type_id) {
		return movieDao.deltype(commodity_type_id);
	}
	
	//�޸ĵ�Ӱ����
	public int updtype(CommodityType commodityType) {
		return movieDao.updtype(commodityType);
	}
	
	//ͨ��id��ȡ��Ӱ����
	public CommodityType getMovieTypeById(int commodity_type_id) {
		return movieDao.getMovieTypeById(commodity_type_id);
	}
//		//����
//	@Override
//	public Commodity detailshow() {
//		// TODO Auto-generated method stub
//		return movieDao.detailshow();
//	}

}
