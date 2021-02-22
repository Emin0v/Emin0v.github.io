package com.company.service;

import com.company.model.User;
import com.company.service.inter.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.User.UserBuilder;

import java.util.List;

import static org.springframework.security.core.userdetails.User.withUsername;

@Service("userDetailsService")
public class CustomUserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserServiceInter userServiceInter;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userServiceInter.getUser(username);

        if(user!=null){
            UserBuilder builder = withUsername(username);
            builder.disabled(false);
            builder.password(user.getPassword());

            List<String> list = userServiceInter.getGroup(user.getId());
            String[] arr = new String[list.size()];

            for(int i=0;i<list.size();i++){
                arr[i]=list.get(i);
            }

            builder.authorities(arr);

            return builder.build();

        }else {
            throw new UsernameNotFoundException("user not found");
        }
    }
}
