package com.inkspace.ejb;

import jakarta.ejb.Stateful;

@Stateful
public class BlogBean implements BlogBeanRemote {

    private double balance = 0.0;

    @Override
    public double deposit(double currentBalance, double amount) {
        if (amount <= 0) throw new IllegalArgumentException("Deposit amount must be positive.");
        this.balance = currentBalance + amount;
        return this.balance;
    }

    @Override
    public double withdraw(double currentBalance, double amount) throws Exception {
        if (amount <= 0) throw new IllegalArgumentException("Withdrawal amount must be positive.");
        if (amount > currentBalance) throw new Exception("Insufficient balance.");
        this.balance = currentBalance - amount;
        return this.balance;
    }

    @Override
    public double getBalance() {
        return this.balance;
    }
}
