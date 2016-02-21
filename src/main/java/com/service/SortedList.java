package com.service;

import java.util.ArrayList;
import java.util.Collections;

/**
 * Created by willydekido on 20/02/16.
 * This class stores a sorted list of numbers
 */
public class SortedList<E> extends ArrayList<E> {

    /**
     * Insert a new element in descending order
     * @param element the list element to be inserted
     */
    public void insertDescending(E element) {
        add(element);
        Comparable<E> comp = (Comparable<E>) element;
        for (int i = size()-1; i > 0 && comp.compareTo(get(i-1)) > 0; i--) {
            Collections.swap(this, i, i-1);
        }
    }

}
