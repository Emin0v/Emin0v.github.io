package com.company;

import com.company.dao.impl.WorkHourRepository;
import com.company.model.User;
import com.company.model.WorkHour;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class HospitalDbAppJpaSpringApplication {

//	  @Autowired
//	  private WorkHourRepository workHourRepository;

	public static void main(String[] args) {
		SpringApplication.run(HospitalDbAppJpaSpringApplication.class, args);
	}

//	@Bean
//	public CommandLineRunner run(){
//		CommandLineRunner clr = new CommandLineRunner() {
//			@Override
//			public void run(String... args) throws Exception {
//				WorkHour w = workHourRepository
//						.findByDoctorIdAndWorkDate(new User(2) , "2021-01-08T22:49");
//
//				System.out.println("WorkHour="+w);
//
//			}
//		};
//		return clr;
//	}

}
