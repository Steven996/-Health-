package dao;

import java.util.List;

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
}
