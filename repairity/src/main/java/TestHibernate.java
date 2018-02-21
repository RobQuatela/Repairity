

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.service.CompanyService;

public class TestHibernate {

	public static void main(String[] args) {
		
		ApplicationContext appContext = new AnnotationConfigApplicationContext(AppConfig.class);
		
		Company company = new Company("SSB", "ATLANTA");
		CompanyService service = appContext.getBean("companyService", CompanyService.class);
		service.saveCompany(company);
		service.saveCompany(new Company("HOU", "HOUSTON"));
		
		System.out.println(company.getName() + " has been inserted");
		
		
	}
}
