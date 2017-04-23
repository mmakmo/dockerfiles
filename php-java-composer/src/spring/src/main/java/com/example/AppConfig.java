package com.example;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;

@Configuration
@EnableSwagger2
 public class AppConfig {

    @Bean
    public Docket api() { 
        return new Docket(DocumentationType.SWAGGER_2)  
          .select()                                  
          .apis(RequestHandlerSelectors.any())              
          .paths(PathSelectors.any())                          
          .build();                                           
    }

    // private Predicate<String> paths() {
    //     return or(containsPattern("/api*"));
    // }

    private ApiInfo apiInfo() {
        ApiInfo apiInfo = new ApiInfo("Sample API", "",
                "terms of service", "", "", "", "");
        return apiInfo;
    }
}