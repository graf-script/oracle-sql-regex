------------- REGEXP_LIKE

REGEX_LIKE(source_string, serach_pattern [, match_parameter]);
/*
This function searches a character column for a pattern. Use this function in the WHERE clause of a
query to return rows matching the regular expression you specify.

1) source_string
is a string for which to be searched. Typically, it is a character column of any data type CHAR,
VARCHAR2, NCHAR, NVARCHAR2, CLOB, or NCLOB.

2) search_pattern
is a literal string that represents the regular expression pattern to be matched.
3) match_parameter
is a literal string that changes the default matching behavior of the REGEXP_LIKE() function.
*/
-- Retrieve all of the names that contain the letter 'm'

SELECT * FROM employees 
    WHERE 
        REGEXP_LIKE(first_name, 'm');

-- Match on more than one alternative

SELECT last_name FROM employees 
    WHERE 
        REGEXP_LIKE(last_name, 'Atkins(o|e|a)n');

-- Match on beginning - Return all employees whise last_name starts with 'A'

SELECT last_name FROM employees 
    WHERE 
        REGEXP_LIKE (last_name, '^A(*)');

-- Match on end - return all employees whosee last_name ends with 'on'

SELECT last_name FROM employees 
    WHERE 
        REGEXP_LIKE(last_name, '(*)on$');

-- Retrieve all of the names that contain the letter-sequence 'be' or 'ae'

SELECT * FROM employees 
    WHERE 
        REGEXP_LIKE (first_name, 'be|ae');

SELECT * FROM employees 
    WHERE 
        REGEXP_LIKE (first_name, 'a(b|c)e');

SELECT * FROM employees 
    WHERE 
        REGEXP_LIKE (first_name, 'be|ae','c');

SELECT * FROM employees 
    WHERE 
        REGEXP_LIKE (first_name, 'be|ae', 'i');

-- caret (^) operator to indicate a beginning-of-line character

SELECT * FROM employees 
    WHERE 
        REGEXP_LIKE(last_name,'^a','i');
