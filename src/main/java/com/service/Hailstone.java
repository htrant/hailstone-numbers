package com.service;

import java.util.HashMap;

public class Hailstone {
    private long number;

    /**
     * Constructor
     * @param inputNumber long first number of hailstone sequence
     */
    public Hailstone(long inputNumber) {
        this.number = inputNumber; //assign inputted number to 1st element of sequence
    }

    /**
     *
     * @return HashMap<String, Long> key pair value storing step and 2nd largest number
     */
    public HashMap<String, Long> getResult() {
        SortedList<Long> sequence = new SortedList<Long>(); //collection of all elements
        HashMap<String, Long> kvp = new HashMap<String, Long>();
        int stepCounter = 0;

        while (number != 1) {
            if ((number%2) == 0) {
                number = number/2;
                stepCounter++;
            } else {
                number = (number*3)+1;
                stepCounter++;
            }
            sequence.insertDescending(number);
        }

        kvp.put("step", (long) stepCounter);
        if (sequence.size() > 1) {
            kvp.put("number", sequence.get(1));
        } else {
            kvp.put("number", (long) 1);
        }

        return kvp;
    }
}
