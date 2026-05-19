# World Layoffs — Data Cleaning (MySQL)
Data cleaning project on a global tech layoffs dataset using MySQL.

## Dataset
3,000+ rows covering tech company layoffs worldwide.  
Source: https://www.kaggle.com/datasets/swaptr/layoffs-2022

## What this project covers
- Created a working copy of raw data to preserve the original
- Removed 300+ duplicate rows using ROW_NUMBER() and CTEs
- Resolved NULL and blank values across key fields
- Standardized inconsistent text fields using TRIM and joins
- Structured the cleaned data into a final output table

## Key Techniques
CTEs, ROW_NUMBER(), Temp Tables, JOIN-based NULL resolution, TRIM, Standardization

## Tools
MySQL Workbench

## Note
This project focuses purely on data cleaning. No analysis has been performed.
