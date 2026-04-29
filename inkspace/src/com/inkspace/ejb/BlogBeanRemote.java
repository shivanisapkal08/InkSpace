package com.inkspace.ejb;

import jakarta.ejb.Remote;

@Remote
public interface BlogBeanRemote {
    double deposit(double balance, double amount);
    double withdraw(double balance, double amount) throws Exception;
    double getBalance();
}
