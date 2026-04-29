CREATE DATABASE inkspace;
USE inkspace;

-- Blogs table (Assignment 5 - Servlet / Assignment 6 - JSP)
CREATE TABLE blogs (
    blog_id     INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255)  NOT NULL,
    author      VARCHAR(100)  NOT NULL,
    content     TEXT          NOT NULL,
    category    VARCHAR(50),
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Users table
CREATE TABLE users (
    user_id     INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50)   NOT NULL,
    last_name   VARCHAR(50)   NOT NULL,
    username    VARCHAR(50)   UNIQUE NOT NULL,
    email       VARCHAR(100)  UNIQUE NOT NULL,
    mobile      VARCHAR(15),
    password    VARCHAR(255)  NOT NULL,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Comments table
CREATE TABLE comments (
    comment_id  INT AUTO_INCREMENT PRIMARY KEY,
    blog_id     INT,
    username    VARCHAR(50),
    comment     TEXT,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (blog_id) REFERENCES blogs(blog_id)
);

-- Insert sample data
INSERT INTO blogs (title, author, content, category) VALUES
('Getting Started with InkSpace', 'Admin', 'Welcome to InkSpace, your creative blogging platform!', 'Tech'),
('Top 10 Writing Tips', 'Jane Doe', 'Writing well takes practice. Here are the top 10 tips...', 'Writing'),
('The Future of AI', 'John Smith', 'Artificial Intelligence is reshaping every industry...', 'Technology');

INSERT INTO users (first_name, last_name, username, email, mobile, password) VALUES
('Admin', 'User', 'admin', 'admin@inkspace.com', '9876543210', 'admin123');
