create table assignment1.books(line string) partitioned by (bkname string)
row format delimited fields terminated by '/n';


load data local inpath '/home/administrator/books/A mid summer night dream.txt'
into table assignment1.books
PARTITION(bkname='A mid summer night dream.txt');


load data local inpath '/home/administrator/books/Hamlet.txt'
into table assignment1.books
PARTITION(bkname='Hamlet.txt');

load data local inpath '/home/administrator/books/King Richard III.txt'
into table assignment1.books
PARTITION(bkname='King Richard III.txt');


load data local inpath '/home/administrator/books/MacBeth.txt'
into table assignment1.books
PARTITION(bkname='MacBeth.txt');


load data local inpath '/home/administrator/books/Othello.txt'
into table assignment1.books
PARTITION(bkname='Othello.txt');


load data local inpath '/home/administrator/books/Romeo and Juliet.txt'
into table assignment1.books
PARTITION(bkname='Romeo and Juliet.txt');


load data local inpath '/home/administrator/books/The Merchant of Venice.txt'
into table assignment1.books
PARTITION(bkname='The Merchant of Venice.txt');


load data local inpath '/home/administrator/books/The tempest.txt'
into table assignment1.books
PARTITION(bkname='The tempest.txt');


load data local inpath '/home/administrator/books/The tragedy of Julius Casear.txt'
into table assignment1.books
PARTITION(bkname='The tragedy of Julius Casear.txt');


load data local inpath '/home/administrator/books/The tragedy of King Lear.txt'
into table assignment1.books
PARTITION(bkname='The tragedy of King Lear.txt');


insert overwrite local directory '/home/administrator/book'
select explode(ngrams(sentences(lower(line)), 3,10))
from assignment1.books;
