/* Query 1: List all the books titles ascending order*/
select title, release_year from books 
order by title;
/* Query 2: List the author of On The Road */
select name from people where
p_id in (select  p_id from books, authorship, people where (books.title = 'On The Road')
        and (authorship.author=people.p_id)
        and (books.isbn = authorship.book));
/* Query 3: List books and authors who are more expensive than 20$ */
select title, name from books, authorship, people where(
  books.price > 20 
  and (authorship.author=people.p_id)
  and (books.isbn = authorship.book)
  );

/* Query 4: Books same title, different Author*/
select title, name 
from books, authorship, people 
where (authorship.author=people.p_id
       and books.isbn = authorship.book
       and title in(select distinct b1.title 
                  from books b1, books b2
                  where (b1.title = b2. title and b1.isbn <> b2. isbn)));

/*Subquery5 to find a top publisher
select P TopPublisher,R MaxRevenue from(
      select pub_id P,SUM(amount*books.price) R  
      from purchase, orders, books, publishers, publishing 
      where (o_date >='01/JAN/2021' and o_date < '01/JAN/2022')
      and p_order=o_id
      and purchase.book = books.isbn
      and books.isbn = publishing.book
      and publisher = pub_id
      group by pub_id
      order by SUM(amount*books.price) DESC
    )WHERE ROWNUM = 1
    ;*/
/*Query 5: Whos the publisher with the highest revenue in 2021*/
select Name,City from Publishers where pub_id in
(select P TopPublisher
      from(
      select pub_id P,SUM(amount*books.price) R 
      from purchase, orders, books, publishers, publishing 
      where (o_date >='01/JAN/2021' and o_date < '01/JAN/2022')
      and p_order=o_id
      and purchase.book = books.isbn
      and books.isbn = publishing.book
      and publisher = pub_id
      group by pub_id
      order by SUM(amount*books.price) DESC
    )WHERE ROWNUM = 1
    );

/* Query 6: List all the books by the Author of bestseller 2021*/
select title, release_year, people.name from books, authorship, people
where author = p_id and books.isbn = authorship.book
  and author in (
      select author 
      from authorship 
      where book in (
          select BestSeller from (
          select book BestSeller, SUM(amount)
          from purchase, orders 
               where 
               o_date >='01/JAN/2021' 
               and o_date < '01/JAN/2022'
               and p_order=o_id
               group by book
               order by SUM(amount) DESC
            )WHERE ROWNUM = 1
      )
    )
order by title;

/*Subquery for 7: How many books were written by Stephen King*/
select count(books.isbn) Books_By_Stephen_King
from books, authorship, people
where isbn = book
and author = p_id
and name = 'Stephen King';
/*Query 7: Persons who has bought all Stephen King books*/
select Name, ssn, address from people where
p_id in (
      select buyer
      from orders, purchase, books, authorship, people
      where p_order= o_id
      and isbn = purchase.book
      and isbn = authorship.book
      and author = p_id
      and name = 'Stephen King'
      having count (distinct purchase.book) >= 
        (select count(books.isbn) 
          from books, authorship, people
          where isbn = book
          and author = p_id
          and name = 'Stephen King')
      group by buyer
      );
/* Query 8 First we create a person, than we create a book he/she wrote
and we update authorship table*/
/* if you want to test sth add ALTER TABLE People DROP CONSTRAINT UC_people;*/
ADDPERSON begin
insert into people (p_id, ssn, name, address)
  values ((select max(p_id)+1 from people), '123-321-123','John Doe', '10001 Govninsk st, Ebenya city, Muhosranks state');
insert into books (isbn,title,release_year,price)
  values ((select max(isbn)+1 from books), 'My Shitty Death at Nowhere', '2022', 10.4);
/*We didn't add a publisher thought it is not a mandatory*/
insert into Authorship (book, author)
  values ((select max(isbn) from books),(select max(p_id) from people));

end ADDPERSON;

/*Query 9: Increase price by $2 if it's lower than $10*/
update books
set price =price + 2
where price <10;
/*Query 10: Delete the chicago*/
DELETE publishers
WHERE City='Chicago';
delete from books where isbn not in (select book from publishing);

