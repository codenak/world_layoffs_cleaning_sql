-- Make copy of raw for cleaning
select * from layoffs;
create table layoffs2 as select * from layoffs;


-- Remove Duplicates
select *, 
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions)
as row_id from layoffs2;

with ranks as (
  select *, 
  row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions)
as row_id from layoffs2)
select * from ranks where row_id > 1;

create table `layoffs3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int default null,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int default null,
  `row_id` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs3
select *, 
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions)
as row_id from layoffs2;


-- Data CLeaning
update layoffs3 set company = trim(company);
update layoffs3 set country = 'United States' where country = 'United States.';
update layoffs3 set industry = 'Crypto' where industry like 'Crypto%';
update layoffs3 t1 join layoffs3 t2 on t1.company = t2.company set t1.industry = t2.industry where t1.industry = '' and t2.industry != '';
update layoffs3 set `date` = str_to_date(`date`, '%m/%d/%Y');
alter table layoffs3 modify column `date` date;
delete from layoffs3 where total_laid_off is null and percentage_laid_off is null;
alter table layoffs3 drop column row_id;

select * from layoffs3;
