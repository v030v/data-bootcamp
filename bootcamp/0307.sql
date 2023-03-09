Create table  exchange(
    ex_date date,
    ex_rate float
    currency varchar(10),
    sanda_panda int
    primary key(ex_date, currency, sanda_panda)
)