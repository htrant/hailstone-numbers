package com.controller;

import com.google.gson.Gson;
import com.service.Hailstone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet(name = "ResultController")
public class ResultController extends HttpServlet {
    public static final long serialVersionUID = 1L;

    public ResultController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long inputNumber = Long.parseLong(request.getParameter("number")); //get user's input number

        /* get result from hailstone sequence */
        Hailstone hs = new Hailstone(inputNumber);
        HashMap<String, Long> kvp = hs.getResult();

        /* prepare and return result as json */
        Gson gson = new Gson();
        String json = gson.toJson(kvp);
        PrintWriter pw = response.getWriter();
        pw.write(json);
    }
}
