package org.geo.domain;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AuthVO {

  private String userid;
  private String auth;
  
}
