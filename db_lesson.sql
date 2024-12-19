Q1
CREATE TABLE departments(
department_id INT(10) UNSGINED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
Alter TABLE people ADD department_id INT(10) UNSIGNED AFTER email;

Q3 
追加する部署一覧(departments)
INSERT INTO departments (name) VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

追加する人の条件(people)
INSERT INTO people (name, email, age, gender) 
VALUES
('山田太郎', 'yamada@gizumo.jp', 30, 1),
('渋谷かな', 'shibuya@gizumo.jp', 21, 2),
('池崎二郎', 'ikezaki@gizumo.jp', 45, 1),
('品川なおみ', 'shinagawa@gizumo.jp', 33, 2),
('江ノ島三郎', 'enoshima@gizumo.jp', 26, 1);

追加する日報の条件(reports)
INSERT INTO reports (content, person_id) 
VALUES
('今日は商談をしました。', 1),
('今日はトラブルがありました。', 2),
('今日は現場へ向かいました', 3),
('今日は目的を達成できました。', 4),
('今日はテスト実行しました。', 6),
('今日は課題を終わらせました。', 7),
('今日は臨機応変に対応しました。', 8),
('今日は環境設定をしました。', 9),
('今日は必要な物を発注しました。', 10),
('今日は体調不良で休みました。', 11);

Q4
UPDATE people SET department_id = 1 WHERE person_id IN (1, 2, 7);
UPDATE people SET department_id = 2 WHERE person_id IN (3, 4, 6, 8);
UPDATE people SET department_id = 3 WHERE person_id = 9;
UPDATE people SET department_id = 4 WHERE person_id = 10;
UPDATE people SET department_id = 5 WHERE person_id = 11;

Q5年齢の降順で男性の名前と年齢を取得してください。
select name,age,gender FROM people WHERE gender = 1 ORDER BY age DESC;

Q6テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明してください。
Peopleテーブルの中にある
nameカラムとemailカラムとageカラムのレコードを見れるように選択し、
なおかつdepartment_id = 1 の条件に当てはまるレコードを作られた昇順に表示させる。

Q720代の女性と40代の男性の名前一覧を取得してください。
SELECT name, age, gender FROM people WHERE age BETWEEN 40 AND 49 OR age BETWEEN 20 AND 29;


Q8営業部に所属する人だけを年齢の昇順で取得してください。
SELECT name, department_id, age FROM people WHERE department_id = 1 ORDER BY age;


Q9開発部に所属している女性の平均年齢を取得してください。
SELECT AVG(age) AS average_age FROM people WHERE gender = 2 AND department_id = 2;

Q10名前と部署名とその人が提出した日報の内容を同時に取得してください。（日報を提出していない人は含めない）
SELECT p.person_id, p.name, r.content, d.Name FROM people p JOIN reports r ON p.person_id = r.person_id JOIN departments d ON p.department_id = d.department_id;

Q11日報を一つも提出していない人の名前一覧を取得してください。
SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id) WHERE content IS NULL ;


