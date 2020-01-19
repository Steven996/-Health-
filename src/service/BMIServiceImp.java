package service;

import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BMIDao;
import po.Customer;

@Service("BMIService")
public class BMIServiceImp implements BMIService{
@Autowired BMIDao bmiDao;
	@Override
	public String bmitest(double customer_height, double customer_weight) {
		DecimalFormat df=new DecimalFormat("0.0");
		String suggest = null;
		double bmi = customer_weight/(customer_height*customer_height);
		if(bmi<=18.4) {
			suggest = "      为偏瘦体质，请合理饮食";
		}else if(bmi>=18.5  && bmi<=23.9) {
			suggest = "      为正常体质，请合理饮食";
		}else if(bmi>=24.0 && bmi<=27.9) {
			suggest = "      为过重体质，请合理饮食";
		}else if(bmi>=28.0) {
			suggest = "      为肥胖体质，请合理饮食";
		}
		System.out.println(bmi+suggest);
		return df.format(bmi)+""+suggest;
	}
	
}
