package com.nuriggiri.nuriggiri.config;

import com.nuriggiri.nuriggiri.interceptor.AuthInterceptor;
import com.nuriggiri.nuriggiri.interceptor.AutoLoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
   private AutoLoginInterceptor autoLoginInterceptor;
    @Autowired
    private AuthInterceptor authInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //자동로그인 설정하기
        registry.addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**");

//        registry.addInterceptor(authInterceptor)
//                .addPathPatterns("/**") // 해당 인터셉터를 적용할 수단
//                //리소스 구간 제외
//                .excludePathPatterns("/css/**", "/dist/**", "/etc/**", "/images/**", "/plugins/**")
//                //인터셉터를 적용하지 않을 예외 구간 설정
//                .excludePathPatterns("/sign/in", "/sign/up", "/sign/pwSearch", "/");
    }

}
