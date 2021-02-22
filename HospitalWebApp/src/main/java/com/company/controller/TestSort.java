package com.company.controller;

import com.company.model.Worker;

import java.util.Comparator;

public class TestSort implements Comparator<Worker> {
    @Override
    public int compare(Worker o1, Worker o2) {
        return o1.getUserId().getId()-o2.getUserId().getId();
    }
}
