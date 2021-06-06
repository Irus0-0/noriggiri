package com.nuriggiri.nuriggiri.config;

import com.nuriggiri.nuriggiri.interceptor.AutoLoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
   private AutoLoginInterceptor autoLoginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //자동로그인 설정하기
        registry.addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**");
    }
}
