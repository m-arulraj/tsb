package com.tsb.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class TsbSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.inMemoryAuthentication().passwordEncoder(passwordEncoder).withUser("user@user.com")
				.password(passwordEncoder.encode("123456")).roles("USER").and().withUser("admin@user.com")
				.password(passwordEncoder.encode("123456")).roles("USER", "ADMIN");

		/*
		 * auth.jdbcAuthentication().dataSource(dataSource)
		 * .usersByUsernameQuery("select username,password, enabled from users where username=?"
		 * )
		 * .authoritiesByUsernameQuery("select username, role from user_roles where username=?"
		 * );
		 */
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SessionRegistry sessionRegistry() {
		return new SessionRegistryImpl();
	}
	
	@Autowired
    private SessionRegistry sessionRegistry;

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
				.antMatchers("/", "/public/**", "/resources/**", "/resources/public/**", "/webjars/**", "/login",
						"/users/add")
				.permitAll()
				.antMatchers("/**")
				.hasAnyRole("ADMIN", "USER")
				.and().formLogin()
					.loginPage("/login")
					.defaultSuccessUrl("/home")
					.failureUrl("/login?error=true")
					.permitAll()
				.and().logout()
					.logoutSuccessUrl("/login?logout=true")
					.clearAuthentication(true)
					.invalidateHttpSession(true)
					.deleteCookies("JSESSIONID")
					.permitAll()
				.and()
					.exceptionHandling()
					.accessDeniedPage("/403")
				.and()
					.csrf()
					.disable()
					;

			http.sessionManagement()
				.maximumSessions(100)
				.maxSessionsPreventsLogin(false)
				.expiredUrl("/login")
				.sessionRegistry(sessionRegistry);
	}
}
