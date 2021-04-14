package therap.javafest.todo.configuration;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author erfan
 * @since 4/14/21
 */
@Configuration
public class WebConfiguration implements WebMvcConfigurer {

    @Bean
    public FilterRegistrationBean sitemeshFilter() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new SitemeshFilter());

        return filterRegistrationBean;
    }
}
