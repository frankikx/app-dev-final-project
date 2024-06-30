package com.appdevfinalproject.common;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CommonFunctions {
    public static void dispatchWithNotif(String url, String modalHeader, String modalContent, HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("modalHeader", modalHeader);
        request.setAttribute("modalContent", modalContent);

        RequestDispatcher dispatch = request.getRequestDispatcher(url);
        try {
            dispatch.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
