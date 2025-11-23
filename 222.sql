
create  database video_games;
USE video_games;
create table vgsales (
Rank_g int,
name varchar(255),
platform varchar(50),
year int,
genre varchar(50),
   -- الشركة الناشرة
    Publisher VARCHAR(255),
    
    -- المبيعات في أمريكا الشمالية بالمليون
    NA_Sales DECIMAL(10,2),
	
    -- المبيعات في أوروبا بالمليون
    EU_Sales DECIMAL(10,2),
    
    -- المبيعات في اليابان بالمليون
    JP_Sales DECIMAL(10,2),
    
    -- المبيعات في باقي العالم بالمليون
    Other_Sales DECIMAL(10,2),
    
    -- إجمالي المبيعات العالمية بالمليون
    Global_Sales DECIMAL(10,2)
);
-- حساب عدد الناشرين الفريدين (بدون تكرار)
USE video_games;
select count(distinct publisher) as unique_publishers
FROM vgsales;
USE video_games;
-- حساب عدد المنصات الفريدة
SELECT COUNT(DISTINCT Platform) AS unique_platforms

-- من جدول المبيعات
FROM vgsales;
-- حساب عدد أنواع الألعاب المختلفة
SELECT COUNT(DISTINCT Genre) AS unique_genres

-- من جدول المبيعات
FROM vgsales;
-- جمع كل المبيعات العالمية
SELECT SUM(Global_Sales) AS total_global_sales

-- من جدول المبيعات
FROM vgsales;
-- حساب متوسط المبيعات لكل لعبة
SELECT AVG(Global_Sales) AS average_sales

-- من جدول المبيعات
FROM vgsales;
-- إيجاد أعلى رقم مبيعات
SELECT MAX(Global_Sales) AS max_sales

-- من جدول المبيعات
FROM vgsales;
-- اختيار مجموع المبيعات لكل منطقة
SELECT 
    -- مجموع مبيعات أمريكا الشمالية
    SUM(NA_Sales) AS north_america,
    
    -- مجموع مبيعات أوروبا
    SUM(EU_Sales) AS europe,
    
    -- مجموع مبيعات اليابان
    SUM(JP_Sales) AS japan,
    
    -- مجموع مبيعات باقي العالم
    SUM(Other_Sales) AS other_regions,
    
    -- المجموع الكلي
    SUM(Global_Sales) AS total

-- من جدول المبيعات
FROM vgsales;
-- حساب النسبة المئوية لكل منطقة
SELECT 
    -- نسبة أمريكا الشمالية مقربة لخانتين
    ROUND(SUM(NA_Sales) / SUM(Global_Sales) * 100, 2) AS na_percent,
    
    -- نسبة أوروبا
    ROUND(SUM(EU_Sales) / SUM(Global_Sales) * 100, 2) AS eu_percent,
    
    -- نسبة اليابان
    ROUND(SUM(JP_Sales) / SUM(Global_Sales) * 100, 2) AS jp_percent,
    
    -- نسبة باقي العالم
    ROUND(SUM(Other_Sales) / SUM(Global_Sales) * 100, 2) AS other_percent

-- من جدول المبيعات
FROM vgsales;
-- اختيار بيانات كل نوع من الألعاب
SELECT 
    -- اسم النوع
    Genre,
    
    -- عدد الألعاب من هذا النوع
    COUNT(*) AS number_of_games,
    
    -- إجمالي المبيعات لهذا النوع
    SUM(Global_Sales) AS total_sales,
    
    -- متوسط المبيعات لهذا النوع
    ROUND(AVG(Global_Sales), 2) AS avg_sales

-- من جدول المبيعات
FROM vgsales

-- تجميع النتائج حسب النوع
GROUP BY Genre

-- ترتيب من الأعلى للأقل مبيعات
ORDER BY total_sales DESC;
-- اختيار بيانات الناشرين
SELECT 
    -- اسم الناشر
    Publisher,
    
    -- عدد ألعاب هذا الناشر
    COUNT(*) AS number_of_games,
    
    -- إجمالي مبيعات هذا الناشر
    SUM(Global_Sales) AS total_sales

-- من جدول المبيعات
FROM vgsales

-- تجميع حسب الناشر
GROUP BY Publisher

-- ترتيب من الأعلى للأقل
ORDER BY total_sales DESC

-- عرض أول 10 فقط
LIMIT 10;
-- اختيار بيانات المنصات
SELECT 
    -- اسم المنصة
    Platform,
    
    -- عدد الألعاب على هذه المنصة
    COUNT(*) AS number_of_games,
    
    -- إجمالي المبيعات على هذه المنصة
    SUM(Global_Sales) AS total_sales

-- من جدول المبيعات
FROM vgsales

-- تجميع حسب المنصة
GROUP BY Platform

-- ترتيب من الأعلى للأقل
ORDER BY total_sales DESC;

-- اختيار بيانات كل سنة
SELECT 
    -- السنة
    Year,
    
    -- عدد الألعاب في هذه السنة
    COUNT(*) AS number_of_games,
    
    -- إجمالي المبيعات في هذه السنة
    SUM(Global_Sales) AS total_sales

-- من جدول المبيعات
FROM vgsales

-- استبعاد السنوات الفارغة
WHERE Year IS NOT NULL

-- تجميع حسب السنة
GROUP BY Year

-- ترتيب حسب السنة تصاعدياً
ORDER BY Year;
-- اختيار بيانات الألعاب
SELECT 
    -- ترتيب اللعبة
    Rank_g,
    
    -- اسم اللعبة
    Name,
    
    -- المنصة
    Platform,
    
    -- سنة الإصدار
    Year,
    
    -- نوع اللعبة
    Genre,
    
    -- الناشر
    Publisher,
    
    -- المبيعات العالمية
    Global_Sales

-- من جدول المبيعات
FROM vgsales

-- ترتيب من الأعلى للأقل مبيعات
ORDER BY Global_Sales DESC

-- عرض أول 10 فقط
LIMIT 10;
-- اختيار بيانات ألعاب نينتندو
SELECT 
    -- اسم اللعبة
    Name,
    
    -- المنصة
    Platform,
    
    -- سنة الإصدار
    Year,
    
    -- المبيعات العالمية
    Global_Sales

-- من جدول المبيعات
FROM vgsales

-- فقط ألعاب نينتندو
WHERE Publisher = 'Nintendo'

-- ترتيب من الأعلى للأقل
ORDER BY Global_Sales DESC

-- عرض أول 10 فقط
LIMIT 10;
-- اختيار الألعاب اللي مبيعاتها أعلى من 10 مليون
SELECT 
    -- اسم اللعبة
    Name,
    
    -- المنصة
    Platform,
    
    -- الناشر
    Publisher,
    
    -- المبيعات العالمية
    Global_Sales

-- من جدول المبيعات
FROM vgsales

-- فقط الألعاب اللي مبيعاتها أكتر من 10 مليون
WHERE Global_Sales > 10

-- ترتيب من الأعلى للأقل
ORDER BY Global_Sales DESC;
-- حساب عدد الألعاب الأيقونية
SELECT COUNT(*) AS iconic_games

-- من جدول المبيعات
FROM vgsales

-- فقط اللي مبيعاتها أكتر من 10 مليون
WHERE Global_Sales > 10;
-- حساب عدد الألعاب الأيقونية
SELECT COUNT(*) AS iconic_games

-- من جدول المبيعات
FROM vgsales

-- فقط اللي مبيعاتها أكتر من 10 مليون
WHERE Global_Sales > 10;


