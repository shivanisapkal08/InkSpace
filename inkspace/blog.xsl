<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="[w3.org](http://www.w3.org/1999/XSL/Transform)">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
    <head>
      <title>InkSpace — Employee Records</title>
      <style>
        body {
          font-family: 'Segoe UI', sans-serif;
          background: #f9f9fb;
          padding: 40px;
        }
        h1 {
          text-align: center;
          color: #0f3460;
          font-family: 'Georgia', serif;
          margin-bottom: 30px;
        }
        table {
          width: 100%;
          border-collapse: collapse;
          box-shadow: 0 4px 15px rgba(0,0,0,0.1);
          background: #fff;
        }
        th {
          background: #0f3460;
          color: #e2b96f;
          padding: 14px 18px;
          text-align: left;
        }
        td {
          padding: 12px 18px;
          border-bottom: 1px solid #ddd;
          color: #333;
        }
        tr:nth-child(even) { background: #f0f4ff; }
        tr:hover           { background: #dbe4ff; }
        .active   { color: #27ae60; font-weight: bold; }
        .inactive { color: #c0392b; font-weight: bold; }
      </style>
    </head>
    <body>
      <h1>✒ InkSpace — Employee Records</h1>
      <table>
        <tr>
          <th>Emp ID</th>
          <th>Name</th>
          <th>Department</th>
          <th>Designation</th>
          <th>Email</th>
          <th>Salary (₹)</th>
          <th>Blogs Written</th>
          <th>Status</th>
        </tr>
        <xsl:for-each select="employees/employee">
          <tr>
            <td><xsl:value-of select="emp_id"/></td>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="department"/></td>
            <td><xsl:value-of select="designation"/></td>
            <td><xsl:value-of select="email"/></td>
            <td><xsl:value-of select="salary"/></td>
            <td><xsl:value-of select="blog_count"/></td>
            <td>
              <xsl:attribute name="class">
                <xsl:value-of select="@status"/>
              </xsl:attribute>
              <xsl:value-of select="@status"/>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
