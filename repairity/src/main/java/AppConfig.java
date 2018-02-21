

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({"com.accountomation.repairity"})
public class AppConfig {

	//@Bean(name = "companyService")
	//public CompanyService getCompanyService() {
	//	CompanyServiceImpl service = new CompanyServiceImpl();
	//	//service.setCompanyRepository(getCompanyRepository());
	//	return service;
	//}
	
	//@Bean(name = "companyRepository")
	//public CompanyRepository getCompanyRepository() {
	//	return new CompanyRepositoryImpl();
	//}
}
