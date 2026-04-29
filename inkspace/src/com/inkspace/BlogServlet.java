package com.inkspace;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;

@WebServlet("/blogs")
public class BlogServlet extends HttpServlet {

    private static final String DB_URL  = "jdbc:mysql://localhost:3306/inkspace";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "Pranav1412";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();

        out.println("""
            <!DOCTYPE html>
            <html lang="en">
            <head>
              <meta charset="UTF-8"/>
              <title>InkSpace — Blogs (Servlet)</title>
              <style>
                body { font-family: 'Segoe UI', sans-serif;
                       background:#f9f9fb; padding:40px; }
                h1   { color:#0f3460; font-family:'Georgia',serif;
                       text-align:center; }
                table { width:100%; border-collapse:collapse;
                        background:#fff;
                        box-shadow:0 4px 15px rgba(0,0,0,0.1); }
                th   { background:#0f3460; color:#e2b96f;
                       padding:14px 18px; text-align:left; }
                td   { padding:12px 18px; border-bottom:1px solid #ddd; }
                tr:nth-child(even) { background:#f0f4ff; }
              </style>
            </head>
            <body>
              <h1>✒ InkSpace — All Blogs (Servlet)</h1>
              <table>
                <tr>
                  <th>ID</th><th>Title</th><th>Author</th>
                  <th>Category</th><th>Created At</th>
                </tr>
            """);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            Statement  stmt = conn.createStatement();
            ResultSet  rs   = stmt.executeQuery(
                    "SELECT blog_id, title, author, category, created_at FROM blogs ORDER BY created_at DESC"
            );

            while (rs.next()) {
                out.printf("""
                    <tr>
                      <td>%d</td><td>%s</td><td>%s</td>
                      <td>%s</td><td>%s</td>
                    </tr>
                    """,
                    rs.getInt("blog_id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getString("category"),
                    rs.getTimestamp("created_at")
                );
            }
            rs.close(); stmt.close(); conn.close();

        } catch (Exception e) {
            out.println("<tr><td colspan='5' style='color:red;'>Error: "
                        + e.getMessage() + "</td></tr>");
        }

        out.println("</table></body></html>");
    }
}
