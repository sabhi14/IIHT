package com.cognizant.stockmarket.service;

import java.util.Optional;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.cognizant.stockmarket.controller.AuthenticationController;
import com.cognizant.stockmarket.entity.User;
import com.cognizant.stockmarket.repository.UserRepository;

@Component
public class AppUserDetailService implements UserDetailsService {
	private static final Logger LOGGER = LoggerFactory.getLogger(AuthenticationController.class);

	@Autowired
	private UserRepository userRepository;

	AppUser appUser;
	User user;

	private static final String SMTP_SERVER = "smtp.gmail.com";
	private static final String USERNAME = "thegeekyamit@gmail.com";
	private static final String PASSWORD = "geekyamit";

	private static final String EMAIL_FROM = "thegeekyamit@gmail.com";
	private static final String EMAIL_TO = "mtwn105@gmail.com, dhaval.tan@gmail.com";
	private static final String EMAIL_TO_CC = "";

	private static final String EMAIL_SUBJECT = "Email Confirmation";
	private static final String EMAIL_TEXT = "";

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		user = userRepository.findUserByUsername(username).get();
		System.out.println("inside APPUSERDETAILSERVICE " + user);
		if (user == null) {
			LOGGER.info("USER NOT FOUND");
			throw new UsernameNotFoundException("Username not found");
		} else {
			appUser = new AppUser(user);
		}
		System.out.println("inside APPUSERDETAILSERVICE appuser " + appUser);

		return appUser;
	}

	public User signUp(User user) throws Exception {
		Optional<User> userObj = userRepository.findUserByUsername(user.getUserName());

		if (userObj.isPresent()) {
			LOGGER.info("User already exists");
			throw new Exception("User already exists");
		} else {

			System.out.println(user);
			String pass = user.getPassword();
			user.setPassword(passwordEncoder().encode(pass));
			userRepository.save(user);
			User newUser = userRepository.findUserByUsername(user.getUserName()).get();
			userRepository.addUserRole(newUser.getUserId(), 2);

			Properties prop = System.getProperties();
			prop.put("mail.smtp.host", SMTP_SERVER);
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", "587"); // default port 25
			prop.put("mail.smtp.starttls.enable", "true"); // TLS

			Session session = Session.getInstance(prop, new Authenticator() {
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(USERNAME, PASSWORD);
				}
			});

			try {
				Message msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(USERNAME));
				msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(EMAIL_TO));
				msg.setSubject(EMAIL_SUBJECT);
				msg.setText("Hi, " + user.getUserName() + "\nClick on the link below to confirm your email.\n"
						+ "http://localhost:8082/users/confirm/" + user.getUserId() + "/" + user.getPassword());
				Transport.send(msg);
				LOGGER.debug("DONE");
			} catch (MessagingException ex) {
				ex.printStackTrace();
			}

		}
		return user;
	}

	public User updateProfile(User user) {
		User newUser = userRepository.findUserByUsername(user.getUserName()).get();
		userRepository.updateUserProfile(user.getUserName(), user.getEmail(), user.getMobile(), user.isConfirmed(),
				newUser.getUserId());
		newUser = userRepository.findUserByUsername(user.getUserName()).get();

		return newUser;
	}

	public User updateUserPassword(User user) {
		User newUser = userRepository.findUserByUsername(user.getUserName()).get();
		userRepository.updateUserPassword(passwordEncoder().encode(user.getPassword()), newUser.getUserId());
		newUser = userRepository.findUserByUsername(user.getUserName()).get();
		return newUser;
	}

	public User confirmUser(long id, String pass) {
		userRepository.confirmUser(true, id, pass);
		User newUser = userRepository.findUserById(id);
		return newUser;
	}

	public User getUser(long id) {
		User newUser = userRepository.findUserById(id);
		return newUser;
	}

	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
