package com.example.sports_centar.data;



import java.io.Serializable;

public class AutentifikacijaLoginPostVM implements Serializable
{
    public String username ;
    public String password ;

    public AutentifikacijaLoginPostVM(String username, String password)
    {
        this.username = username;
        this.password = password;
    }
}