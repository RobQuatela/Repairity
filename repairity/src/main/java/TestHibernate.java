

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;
import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.service.CompanyService;
import com.accountomation.repairity.service.IncidentLogService;
import com.accountomation.repairity.service.IncidentService;

public class TestHibernate {

	public static void main(String[] args) {
		
		ApplicationContext appContext = new AnnotationConfigApplicationContext(AppConfig.class);
		
		Company company = new Company("SSB", "ATLANTA");
		CompanyService service = appContext.getBean("companyService", CompanyService.class);
		IncidentService incidentService = appContext.getBean("incidentService", IncidentService.class);
		System.out.println(service);
		//IncidentLogService incidentLogService = appContext.getBean("incidentLogService", IncidentLogService.class); 
		
		CompanyService service1 = appContext.getBean("companyService", CompanyService.class);
		System.out.println(service1);
		
		service.saveCompany(company);
		service.saveCompany(new Company("HOU", "HOUSTON"));
		Incident incident1 = new Incident();
		incident1.setId("1234");
		incidentService.saveIncident(incident1);
		service.addEmployee(company, new Employee("111", "Rob Q", company));
		service.addEmployee(company, new Employee("112", "Sarah Q", company));
		service.addEmployee(company, new Employee("113", "Kelly Q", company));
		
		List<Employee> employees = service.getEmployees(company);
		
		System.out.println(service.find("HOU").getName() + " has been inserted along with " + incidentService.getIncident("1234").getId());
		System.out.println(employees.size());
		
		
		
	}
}
