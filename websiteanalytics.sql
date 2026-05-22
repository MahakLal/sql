-- ==========================================
-- Drop old tables (respecting foreign keys)
-- ==========================================
DROP TABLE IF EXISTS conversions;
DROP TABLE IF EXISTS pageviews;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS users;
CREATE DATABASE WebsiteAnalytics;
USE WebsiteAnalytics;
-- ==========================================
-- Create tables
-- ==========================================
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    signup_date DATE
);

CREATE TABLE sessions (
    session_id INT PRIMARY KEY,
    user_id INT,
    session_start DATETIME,
    session_end DATETIME,
    traffic_source VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE pageviews (
    view_id INT PRIMARY KEY,
    session_id INT,
    page_url VARCHAR(255),
    view_time DATETIME,
    FOREIGN KEY (session_id) REFERENCES sessions(session_id)
);

CREATE TABLE conversions (
    conversion_id INT PRIMARY KEY,
    session_id INT,
    conversion_type VARCHAR(50),
    conversion_value DECIMAL(10,2),
    conversion_time DATETIME,
    FOREIGN KEY (session_id) REFERENCES sessions(session_id)
);

-- ==========================================
-- Insert sample users
-- ==========================================
INSERT INTO users (user_id, name, email, signup_date) VALUES
(1, 'Alice', 'alice@example.com', '2025-01-10'),
(2, 'Bob', 'bob@example.com', '2025-02-05'),
(3, 'Charlie', 'charlie@example.com', '2025-02-20'),
(4, 'Diana', 'diana@example.com', '2025-03-01'),
(5, 'Ethan', 'ethan@example.com', '2025-03-15');

-- ==========================================
-- Insert sessions
-- ==========================================
INSERT INTO sessions (session_id, user_id, session_start, session_end, traffic_source) VALUES
(101, 1, '2025-09-01 09:00:00', '2025-09-01 09:30:00', 'Google'),
(102, 2, '2025-09-01 10:15:00', '2025-09-01 10:45:00', 'Direct'),
(103, 1, '2025-09-02 08:50:00', '2025-09-02 09:05:00', 'Facebook'),
(104, 3, '2025-09-02 11:00:00', '2025-09-02 11:20:00', 'Google'),
(105, 4, '2025-09-02 15:30:00', '2025-09-02 15:50:00', 'Twitter'),
(106, 5, '2025-09-03 09:00:00', '2025-09-03 09:45:00', 'Direct'),
(107, 2, '2025-09-03 13:15:00', '2025-09-03 13:25:00', 'Google'),
(108, 3, '2025-09-03 16:40:00', '2025-09-03 17:10:00', 'Facebook');

-- ==========================================
-- Insert pageviews
-- ==========================================
INSERT INTO pageviews (view_id, session_id, page_url, view_time) VALUES
(1001, 101, '/home', '2025-09-01 09:01:00'),
(1002, 101, '/products', '2025-09-01 09:10:00'),
(1003, 101, '/checkout', '2025-09-01 09:20:00'),
(1004, 102, '/home', '2025-09-01 10:16:00'),
(1005, 102, '/about', '2025-09-01 10:25:00'),
(1006, 103, '/home', '2025-09-02 08:51:00'),
(1007, 104, '/home', '2025-09-02 11:01:00'),
(1008, 104, '/products', '2025-09-02 11:05:00'),
(1009, 105, '/home', '2025-09-02 15:31:00'),
(1010, 105, '/blog', '2025-09-02 15:40:00'),
(1011, 106, '/home', '2025-09-03 09:01:00'),
(1012, 106, '/products', '2025-09-03 09:10:00'),
(1013, 106, '/products/item1', '2025-09-03 09:20:00'),
(1014, 106, '/checkout', '2025-09-03 09:35:00'),
(1015, 107, '/home', '2025-09-03 13:16:00'),
(1016, 108, '/home', '2025-09-03 16:41:00'),
(1017, 108, '/products', '2025-09-03 16:45:00'),
(1018, 108, '/blog', '2025-09-03 16:55:00');

-- ==========================================
-- Insert conversions
-- ==========================================
INSERT INTO conversions (conversion_id, session_id, conversion_type, conversion_value, conversion_time) VALUES
(201, 101, 'purchase', 120.50, '2025-09-01 09:25:00'),
(202, 104, 'signup', NULL, '2025-09-02 11:15:00'),
(203, 106, 'purchase', 75.00, '2025-09-03 09:40:00'),
(204, 108, 'newsletter', NULL, '2025-09-03 17:05:00');
SELECT 
    DATE(session_start) AS date,
    COUNT(DISTINCT user_id) AS daily_active_users
FROM sessions
GROUP BY DATE(session_start)
ORDER BY date;

SELECT 
    page_url,
    COUNT(*) AS views
FROM pageviews
GROUP BY page_url
ORDER BY views DESC
LIMIT 5;

SELECT 
    ROUND(100.0 * COUNT(DISTINCT c.session_id) / COUNT(DISTINCT s.session_id), 2) AS conversion_rate
FROM sessions s
LEFT JOIN conversions c ON s.session_id = c.session_id;

SELECT 
    s.traffic_source,
    SUM(c.conversion_value) AS total_revenue
FROM conversions c
JOIN sessions s ON c.session_id = s.session_id
WHERE c.conversion_type = 'purchase'
GROUP BY s.traffic_source
ORDER BY total_revenue DESC;

SELECT 
    ROUND(AVG(TIMESTAMPDIFF(SECOND, session_start, session_end)) / 60, 2) AS avg_session_minutes
FROM sessions;

SELECT 
    u.user_id,
    u.name,
    COUNT(s.session_id) AS total_sessions
FROM users u
JOIN sessions s ON u.user_id = s.user_id
GROUP BY u.user_id, u.name
HAVING total_sessions > 1
ORDER BY total_sessions DESC;

SELECT 
    conversion_type,
    COUNT(*) AS total_conversions
FROM conversions
GROUP BY conversion_type
ORDER BY total_conversions DESC;
