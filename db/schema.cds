namespace  my.bookshop;

using {cuid, managed} from '@sap/cds/common';

entity Books 
{
Key ID : Integer;
title : String;
stock : Integer;
author : Association to  Authors;
orders : Association to many Order on orders.book = $self;
}

entity Authors
{
key ID : Integer;
name : String;
books : Association to many Books on books.author = $self;
}

entity Order : cuid, managed
{
    book : Association to Books;
    quantity : Integer;
}