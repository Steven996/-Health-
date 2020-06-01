package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import po.Commodity;
import po.CommodityType;
import po.Movie;
import po.News;
import po.User;

public interface MovieDao {
				
								//��Ʒ����
	
	//��ʾ��Ӱ�б�
	public List<Commodity> show();

//	//��ӵ�Ӱ
	public int addm(Commodity commodity);
	
	//ɾ����Ӱ
	public int delm(int commodity_id);
	
	//�޸ĵ�Ӱ
	public int updm(Commodity commodity);
	
	//ͨ��id��ȡ������Ϣ
	public Commodity getMovieById(int commodity_id);
	
	//����
	public List moviesearch(@Param(value="commodity_name")String commodity_name);
	
	//��ȡ��Ƶ
//	public List<Movie> getVideo();
							//�������
	
	//��ʾ��Ӱ����
	public List<CommodityType> showtype();
	
	//��ӵ�Ӱ����
	public int addtype(CommodityType commodityType);
	
	//ɾ����Ӱ����
	public int deltype(int commodity_type_id);
	
	//�޸ĵ�Ӱ����
	public int updtype(CommodityType commodityType);
	
	//ͨ��id��ȡ��Ӱ����
	public CommodityType getMovieTypeById(int commodity_type_id);
	//С֪ʶ
	public News  getclassById(int news_id);
}
