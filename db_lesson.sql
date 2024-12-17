Q1
Create table departments(
department_id int(10) unsigned auto_increment primary key,
Name varchar(20) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);

Q2
Alter table people add department_id int(10) unsigned after email;

Q3 
追加する部署一覧(departments)
Insert into departments (name) values
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

追加する人の条件(people)
Insert into people (name, email, age, gender) 
values
('山田太郎', 'yamada@gizumo.jp', 30, 1),
('渋谷かな', 'shibuya@gizumo.jp', 21, 2),
('池崎二郎', 'ikezaki@gizumo.jp', 45, 1),
('品川なおみ', 'shinagawa@gizumo.jp', 33, 2),
('江ノ島三郎', 'enoshima@gizumo.jp', 26, 1);

追加する日報の条件(reports)
Insert into reports (content, person_id) 
values
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
Update people set department_id = 1 where person_id in (1, 2, 7);
Update people set department_id = 2 where person_id in (3, 4, 6, 8);
Update people set department_id = 3 where person_id = 9;
Update people set department_id = 4 where person_id = 10;
Update people set department_id = 5 where person_id = 11;

Q5年齢の降順で男性の名前と年齢を取得してください。
select name,age,gender from people where gender = 1 order by age DESC;

Q6テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明してください。
Peopleテーブルの中にある
Nameカラムとemailカラムとageカラムのレコードを見れるように選択し、
なおかつdepartment_id = 1 の条件に当てはまるレコードを作られた昇順に表示させる。

Q720代の女性と40代の男性の名前一覧を取得してください。
select name, age, gender from people where age between 40 and 49 or age between 20 and 29;


Q8営業部に所属する人だけを年齢の昇順で取得してください。
select name, department_id, age from people where department_id = 1 order by age;


Q9開発部に所属している女性の平均年齢を取得してください。
select avg(age) as average_age from people where gender = 2 and department_id = 2;

Q10名前と部署名とその人が提出した日報の内容を同時に取得してください。（日報を提出していない人は含めない）
SELECT p.person_id, p.name, r.content, department_id FROM people p JOIN reports r USING (person_id);

Q11日報を一つも提出していない人の名前一覧を取得してください。
SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id) where content is null ;


