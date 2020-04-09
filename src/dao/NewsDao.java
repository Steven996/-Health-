package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import po.Commodity;
import po.News;

public interface NewsDao {
		//��ʾ
		public List<News> newsshow();
		
		//���
		public int newsadd(News news);
		
		//ɾ��
		public int newsdel(int news_id);
		
		//�޸�
		public int newsupd(News news);
		
		//ͨ��id��ȡ��Ϣ
		public News getNewsById(int news_id);
		//��ѯ
		public List newssearch(@Param(value="news_title")String news_title);
}
