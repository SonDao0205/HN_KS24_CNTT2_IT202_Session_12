DROP DATABASE IF EXISTS MiniprojectSS12;
CREATE DATABASE MiniprojectSS12;
USE MiniprojectSS12;
-- tạo bảng dữ liệu
CREATE TABLE Users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Posts(
	post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (post_id)
        REFERENCES Posts (post_id),
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Friends (
    friend_id INT,
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (friend_id)
        REFERENCES Users (user_id),
    status VARCHAR(20) CHECK (status IN ('pending' , 'accepted'))
);

create table Likes(
	user_id INT,
    post_id INT,
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (post_id)
        REFERENCES Posts (post_id)
);

-- Bài 1. Quản lý người dùng
INSERT INTO Users (username, password, email) VALUES
('anhtuan', '123', 'anhtuan@gmail.com'),
('minhan', '123', 'minhan@gmail.com'),
('thanhdat', '123', 'thanhdat@gmail.com'),
('hoangan', '123', 'hoangan@gmail.com'),
('linhchi', '123', 'linhchi@gmail.com'),
('phuongnam', '123', 'phuongnam@gmail.com'),
('quocbao', '123', 'quocbao@gmail.com'),
('myhanh', '123', 'myhanh@gmail.com'),
('tuananh', '123', 'tuananh@gmail.com'),
('anhthu', '123', 'anhthu@gmail.com'),
('vietanh', '123', 'vietanh@gmail.com'),
('hoanglong', '123', 'hoanglong@gmail.com'),
('kimngan', '123', 'kimngan@gmail.com'),
('ngocanh', '123', 'ngocanh@gmail.com'),
('thanhson', '123', 'thanhson@gmail.com'),
('phuongthao', '123', 'phuongthao@gmail.com'),
('ducthinh', '123', 'ducthinh@gmail.com'),
('baotram', '123', 'baotram@gmail.com'),
('huyhoang', '123', 'huyhoang@gmail.com'),
('quynhanh', '123', 'quynhanh@gmail.com');

SELECT user_id,username,password,email,created_at
FROM Users;


INSERT INTO Posts (user_id, content) VALUES
(1, 'Hôm nay học database rất thú vị'),
(2, 'MySQL giúp quản lý dữ liệu hiệu quả'),
(3, 'Mình đang học stored procedure'),
(4, 'Lập trình backend thật sự cuốn'),
(5, 'Cuối tuần học SQL cùng bạn bè'),
(6, 'Index giúp truy vấn nhanh hơn'),
(7, 'View giúp bảo mật dữ liệu'),
(8, 'Hôm nay trời mưa nhẹ'),
(9, 'Tối ưu database rất quan trọng'),
(10, 'Học database để làm backend'),
(11, 'Procedure giúp tái sử dụng code'),
(12, 'Mạng xã hội mini bằng SQL'),
(13, 'Thích nhất là phần join table'),
(14, 'Thực hành SQL mỗi ngày'),
(15, 'Cơ sở dữ liệu quan hệ'),
(16, 'Foreign key rất quan trọng'),
(17, 'Composite index tăng hiệu suất'),
(18, 'Database design quyết định hiệu năng'),
(19, 'SQL không khó nếu chăm học'),
(20, 'Backend developer cần giỏi database');


INSERT INTO Comments (post_id, user_id, content) VALUES
(1,2,'Chuẩn luôn'),
(1,3,'Mình cũng thấy vậy'),
(2,4,'MySQL rất mạnh'),
(3,5,'Procedure hơi khó'),
(4,6,'Backend rất thú vị'),
(5,7,'Cuối tuần học là hợp lý'),
(6,8,'Index quan trọng thật'),
(7,9,'View rất hay'),
(8,10,'Thời tiết dễ ngủ'),
(9,11,'Tối ưu là bắt buộc'),
(10,12,'Backend cần SQL'),
(11,13,'Procedure dùng nhiều'),
(12,14,'Mini project hay'),
(13,15,'Join là nền tảng'),
(14,16,'Ngày nào cũng nên học'),
(15,17,'CSDL rất quan trọng'),
(16,18,'FK giúp tránh lỗi'),
(17,19,'Index tăng tốc'),
(18,20,'Thiết kế chuẩn rất quan trọng'),
(19,1,'SQL dễ mà'),
(20,2,'Backend không thể thiếu DB');


INSERT INTO Friends (user_id, friend_id, status) VALUES
(1,2,'accepted'),
(1,3,'accepted'),
(1,4,'pending'),
(2,5,'accepted'),
(2,6,'pending'),
(3,7,'accepted'),
(3,8,'accepted'),
(4,9,'pending'),
(5,10,'accepted'),
(6,11,'accepted'),
(7,12,'pending'),
(8,13,'accepted'),
(9,14,'accepted'),
(10,15,'pending'),
(11,16,'accepted'),
(12,17,'accepted'),
(13,18,'pending'),
(14,19,'accepted'),
(15,20,'accepted'),
(16,1,'pending');


INSERT INTO Likes (user_id, post_id) VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,2),
(6,2),
(7,2),
(8,3),
(9,3),
(10,3),
(11,4),
(12,4),
(13,5),
(14,5),
(15,6),
(16,7),
(17,8),
(18,9),
(19,10),
(20,10);

-- Bài 2. Hiển thị thông tin công khai bằng VIEW
CREATE VIEW vw_public_users AS
SELECT user_id,username,created_at
FROM Users;

SELECT *
FROM vw_public_users;

SELECT user_id,username,created_at
FROM Users;

-- Bài 3. Tối ưu tìm kiếm người dùng bằng INDEX
CREATE INDEX idx_username ON Users(username);
DROP INDEX idx_username ON Users;

SELECT *
FROM Users
WHERE username = 'anhtuan';

-- Bài 4. Quản lý bài viết bằng Stored Procedure
DELIMITER $$

CREATE PROCEDURE sp_create_post(
    IN p_user_id INT,
    IN p_content TEXT
)
BEGIN
    IF EXISTS (SELECT 1 FROM Users WHERE user_id = p_user_id) THEN
        INSERT INTO Posts(user_id, content)
        VALUES (p_user_id, p_content);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User không tồn tại';
    END IF;
END$$

CALL sp_create_post(1, 'Bài viết mới từ stored procedure');

-- Bài 5. Hiển thị News Feed bằng VIEW
CREATE VIEW vw_recent_posts AS
SELECT p.post_id, u.username, p.content, p.created_at
FROM Posts p
JOIN Users u ON p.user_id = u.user_id
WHERE p.created_at >= NOW() - INTERVAL 7 DAY;

SELECT *
FROM vw_recent_posts
ORDER BY created_at DESC;



-- Bài 6. Tối ưu truy vấn bài viết
CREATE INDEX idx_posts_user_id
ON Posts(user_id);

CREATE INDEX idx_posts_user_created
ON Posts(user_id, created_at);

SELECT *
FROM Posts
WHERE user_id = 1
ORDER BY created_at DESC;

-- Vai trò của Composite Index.
	-- Lọc nhanh theo user
	-- Sắp xếp nhanh theo thời gian
	-- Tránh sort tốn tài nguyên


-- Bài 7. Thống kê hoạt động bằng Stored Procedure
DELIMITER $$

CREATE PROCEDURE sp_count_posts(
    IN p_user_id INT,
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*) INTO p_total
    FROM Posts
    WHERE user_id = p_user_id;
END$$

CALL sp_count_posts(1, @total_posts);
SELECT @total_posts AS total_posts;


-- Bài 8. Kiểm soát dữ liệu bằng View WITH CHECK OPTION
CREATE VIEW vw_active_users AS
SELECT u.user_id, u.username, u.created_at
FROM Users u
JOIN Posts p ON u.user_id = p.user_id
WITH CHECK OPTION;


-- Bài 9. Quản lý kết bạn bằng Stored Procedure
DELIMITER $$

CREATE PROCEDURE sp_add_friend(
    IN p_user_id INT,
    IN p_friend_id INT
)
BEGIN
    IF p_user_id = p_friend_id THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể kết bạn với chính mình';
    ELSE
        INSERT INTO Friends(user_id, friend_id, status)
        VALUES (p_user_id, p_friend_id, 'pending');
    END IF;
END$$

CALL sp_add_friend(1,5);

-- Bài 10. Gợi ý bạn bè bằng Procedure nâng cao
DELIMITER $$

CREATE PROCEDURE sp_suggest_friends(
    IN p_user_id INT,
    INOUT p_limit INT
)
BEGIN
    DECLARE counter INT DEFAULT 0;
    SELECT u.user_id, u.username
        FROM Users u
        WHERE u.user_id != p_user_id
          AND u.user_id NOT IN (
              SELECT friend_id FROM Friends WHERE user_id = p_user_id
          )
        LIMIT p_limit;
END$$
SET @limit = 5;
CALL sp_suggest_friends(1,@limit)

-- Bài 11. Thống kê tương tác nâng cao
CREATE INDEX idx_likes_post_id
ON Likes(post_id);

CREATE VIEW vw_top_posts AS
SELECT p.post_id, p.content, COUNT(l.post_id) AS total_likes
FROM Posts p
JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id
ORDER BY total_likes DESC
LIMIT 5;

SELECT * FROM vw_top_posts;


-- BÀI 12. QUẢN LÝ BÌNH LUẬN
DELIMITER $$

CREATE PROCEDURE sp_add_comment(
    IN p_user_id INT,
    IN p_post_id INT,
    IN p_content TEXT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Users WHERE user_id = p_user_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User không tồn tại';
    ELSEIF NOT EXISTS (SELECT 1 FROM Posts WHERE post_id = p_post_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Post không tồn tại';
    ELSE
        INSERT INTO Comments(user_id, post_id, content)
        VALUES (p_user_id, p_post_id, p_content);
    END IF;
END$$

CALL sp_add_comment(1,1,'hihi');

CREATE VIEW vw_post_comments AS
SELECT c.content, u.username, c.created_at
FROM Comments c
JOIN Users u ON c.user_id = u.user_id;

SELECT *
FROM vw_post_comments;


-- BÀI 13. QUẢN LÝ LƯỢT THÍCH
DELIMITER $$

CREATE PROCEDURE sp_like_post(
    IN p_user_id INT,
    IN p_post_id INT
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM Likes
        WHERE user_id = p_user_id AND post_id = p_post_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Đã thích bài viết này';
    ELSE
        INSERT INTO Likes(user_id, post_id)
        VALUES (p_user_id, p_post_id);
    END IF;
END$$

CALL sp_like_post(1,2);

CREATE VIEW vw_post_likes AS
SELECT post_id, COUNT(*) AS total_likes
FROM Likes
GROUP BY post_id;

SELECT *
FROM vw_post_likes;


-- Bài 14. TÌM KIẾM NGƯỜI DÙNG & BÀI VIẾT
DELIMITER $$

CREATE PROCEDURE sp_search_social(
    IN p_option INT,
    IN p_keyword VARCHAR(100)
)
BEGIN
    IF p_option = 1 THEN
        SELECT user_id, username
        FROM Users
        WHERE username LIKE CONCAT('%', p_keyword, '%');
    ELSEIF p_option = 2 THEN
        SELECT post_id, content
        FROM Posts
        WHERE content LIKE CONCAT('%', p_keyword, '%');
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Option không hợp lệ';
    END IF;
END$$

CALL sp_search_social(1, 'anhtuan');
CALL sp_search_social(2, 'MySQL');



