-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 03:36 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

﻿--
-- Database: `tasdb`
--
﻿
-- --------------------------------------------------------

--
-- Table structure for table `business_unit`
--

CREATE TABLE `business_unit` (
  `B_U_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `business_unit`
--

﻿INSERT INTO `business_unit` (`B_U_Name`) VALUES
('Technology')﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `category_employee`
--

CREATE TABLE `category_employee` (
  `CAT_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `category_employee`
--

﻿INSERT INTO `category_employee` (`CAT_Name`) VALUES
('D-N1')﻿,
('M-N1')﻿,
('PARTNER')﻿,
('SA-N1')﻿,
('SK-N1')﻿,
('SK-N2')﻿,
('SKL-N1')﻿,
('SKL-N2')﻿,
('SN-N1')﻿,
('STL-N1')﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `certification`
--

CREATE TABLE `certification` (
  `C_P_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `C_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `certification`
--

﻿INSERT INTO `certification` (`C_P_Name`, `C_Name`) VALUES
('Agile/Management', 'Certified Scrum Master')﻿,
('Agile/Management', 'Professional Scrum Master')﻿,
('Agile/Management', 'Professional Scrum Master I - Scrum.org')﻿,
('Agile/Management', 'SCRUM - Six Sigma Yellow Belt')﻿,
('Agile/Management', 'Scrum Fundamentals Certified')﻿,
('Agile/Management', 'Scrum Master SCM')﻿,
('AngularJS', 'Shaping up with angularJS')﻿,
('Apigee', 'API Design and Fundamentals of Google Cloud\'s Apigee API Platform (con Honores)')﻿,
('Apigee', 'API Development on Google Cloud\'s Apigee API Platform (con Honores)')﻿,
('Apigee', 'API Security on Google Cloud\'s Apigee API Platform (con Honores)')﻿,
('Apigee', 'Developing APIs with Google Cloud\'s Apigee API Platform')﻿,
('Apigee', 'Google Apigee API Engineer')﻿,
('Apigee', 'Install and Manage Google Cloud\'s Apigee API Platform')﻿,
('Apigee', 'On Premises Capacity Upgrade and Monitoring with Google Cloud\'s Apigee API Platform')﻿,
('Apigee', 'On Premises Installation and Fundamentals with Google Cloud\'s Apigee API Platform')﻿,
('Apigee', 'On Premises Management, Security, and Upgrade with Google Cloud\'s Apigee API Platform')﻿,
('Apttus', 'Quote to Cash Certification')﻿,
('AWS', 'AWS Certified Cloud Practitioner')﻿,
('BluePrism', 'Blue Prism Developer Accreditation Certificate of Excellence')﻿,
('Cloudera', 'Big Data (2015) Specialisation (Coursera)')﻿,
('Cloudera', 'CCA Spark and Hadoop Developer')﻿,
('Cloudera', 'CCP Data Engineer')﻿,
('Cloudera', 'Cloudera Certified Developer for Apache Hadoop CCD-470 (CDH4)')﻿,
('Cloudera', 'Graph Analytics for Big Data (Coursera)')﻿,
('Cloudera', 'Hadoop Platform and Application Framework (Coursera)')﻿,
('Cloudera', 'Introduction to Big Data (Coursera)')﻿,
('Cloudera', 'Introduction to Big Data Analytics (Coursera)')﻿,
('Cloudera', 'Machine Learning with Big Data (Coursera)')﻿,
('Cloudera', 'O\'Reilly Development Certification for Apache Kafka')﻿,
('Confluent', 'Confluent Certified Developer for Apache Kafka')﻿,
('Corda', 'R3 Corda Certified Developer')﻿,
('Front-End', 'Advanced CSS and SASS (Udemy)')﻿,
('Front-End', 'HTML, CSS and Javascript (Cambridge Certification Authority)')﻿,
('Front-End', 'Multiplatform Mobile App Development and other series of front-end and server-side courses (The Hong Kong University of Science and Technology on Coursera)')﻿,
('Front-End', 'Sass Workflow (Udemy)')﻿,
('Hortonworks', 'HDP Certified Developer')﻿,
('IBM - Blockchain', 'IBM Blockchain Essentials')﻿,
('IBM - UX/UI Design', 'The Complete React Web Developer Course (with Redux)')﻿,
('Java', 'Java for Programmers  -  Heriot-Watt University')﻿,
('Java', 'Java Programmer I')﻿,
('Java', 'Java Programmer II')﻿,
('Java', 'Sun Certified Java Programmer (SCJP)')﻿,
('Liferay', 'Liferay 6.2 Certified Professional Developer')﻿,
('Microsoft - Business Intelligence', 'Power BI Pro Essential (LinkedIn)')﻿,
('Microsoft - Business Intelligence', 'Tableau 10 Essential')﻿,
('Microsoft - Cloud', 'Exam 534: Architecting Microsoft Azure Solutions')﻿,
('Microsoft - Cloud', 'Microsoft Azure Core Functionalities')﻿,
('Microsoft - Cloud', 'Microsoft Azure for Developers')﻿,
('Microsoft - Cloud', 'Microsoft Certified Solutions Associate: Cloud Platform')﻿,
('Microsoft - Cloud', 'Microsoft Specialist: Developing Microsoft Azure Solutions')﻿,
('Microsoft - Cloud', 'Microsoft Specialist: Implementing Microsoft Azure Infrastructure Solutions')﻿,
('Microsoft - Programming', 'CTS: .NET Framework 3.5 ASP.NET applications')﻿,
('Microsoft - Programming', 'Developer ADO.NET 2003')﻿,
('Microsoft - Programming', 'Developer ASP.NET 2003')﻿,
('Microsoft - Programming', 'Developer Visual Basic .NET 2003')﻿,
('Microsoft - Programming', 'Implementation SQL Server 2008')﻿,
('Microsoft - Programming', 'Maintenance SQL Server 2008')﻿,
('Microsoft - Programming', 'MCPS: Microsoft Certified Professional')﻿,
('Microsoft - Programming', 'MCSD: App Builder')﻿,
('Microsoft - Programming', 'MCSD: Web Applications Solutions Developer')﻿,
('Microsoft - Programming', 'MCTS: .NET Framework 3.5 Windows Forms applications')﻿,
('Microsoft - Programming', 'MCTS: Programming in HTML5 with JavaScript and CSS3')﻿,
('Microsoft - Programming', 'Programming in HTML5 with JavaScript and CSS3')﻿,
('Microsoft - Programming', 'TS: Web Applications Development with Microsoft .NET Framework 4')﻿,
('Microsoft - SaaS', 'Certified for Microsoft Dynamics CRM 2011 (CRM 2011)')﻿,
('Microstrategy', 'Certified Project Designer (CPD)\r\n')﻿,
('Microstrategy', 'Microstrategy for Business Intelligence')﻿,
('ML/IA', 'Correlation and Regression')﻿,
('ML/IA', 'Data Manipulation in R (DataCamp)')﻿,
('ML/IA', 'Deep Learning Specialization')﻿,
('ML/IA', 'Introduction to Machine Learning (DataCamp)')﻿,
('ML/IA', 'Pattern Discovery in Data Mining')﻿,
('ML/IA', 'Process Mining: Data science in Action')﻿,
('ML/IA', 'R Programming (Coursera)')﻿,
('ML/IA', 'The Data Scientist’s Toolbox (Coursera)')﻿,
('MongoDB', 'MongoDB for DBAs')﻿,
('MongoDB', 'MongoDB for Java Developers')﻿,
('Mulesoft', 'MuleSoft Certified Architect  -  Solution Design Specialist')﻿,
('Mulesoft', 'MuleSoft Certified Developer  -  Connector Specialist')﻿,
('Mulesoft', 'MuleSoft Certified Developer  -  Integration and API Associate')﻿,
('Mulesoft', 'MuleSoft Certified Developer  -  Level 1 (Mule 4)')﻿,
('Mulesoft', 'MuleSoft Certified Developer - API Design Associate')﻿,
('Mulesoft', 'MuleSoft Certified Developer - API Design Associate (RAML 1.0)')﻿,
('Mulesoft', 'Mulesoft Certified Developer (MCD)')﻿,
('Mulesoft', 'MuleSoft Certified Platform Architect - Level 1')﻿,
('Natural', 'Natural Construct  -  Natural Construct CST-004')﻿,
('Natural', 'Natural Lightstorm  -  Natural Lightstorm Implementation 1 Nat-Win')﻿,
('Neo4j', 'Neo4j Certification')﻿,
('Oracle', 'Platform Fundamentals for Developers Rel 11.1')﻿,
('Perl', 'CGI Scripts for the Web using Perl  -  Heriot-Watt University')﻿,
('Project Management - Governance', 'Certified PRINCE2 Practitioner')﻿,
('Project Management - Governance', 'Level 5 Certificate in Coaching and Mentoring (Institute for Leadership and Management)')﻿,
('Project Management - Management', 'Project Management Professional (PMP)')﻿,
('Salesforce', 'Salesforce App Builder')﻿,
('Salesforce', 'Salesforce Certified Administrator')﻿,
('Salesforce', 'Salesforce Certified Administrator (SCA)')﻿,
('Salesforce', 'Salesforce Certified Developer (401)')﻿,
('Salesforce', 'Salesforce Certified Integration Architecture Designer')﻿,
('Salesforce', 'Salesforce Certified Marketing Cloud Email Specialist (SP18)')﻿,
('Salesforce', 'Salesforce Certified Pardot Specialist (SP18)')﻿,
('Salesforce', 'Salesforce Certified Platform App Builder')﻿,
('Salesforce', 'Salesforce Certified Sales Cloud Consultant (SP15)')﻿,
('Salesforce', 'Salesforce Certified Service Cloud Consultant')﻿,
('Salesforce', 'Salesforce Certified Technical Architect')﻿,
('Salesforce', 'Salesforce Certified UNKNOWN1')﻿,
('Salesforce', 'Salesforce Certified UNKNOWN2')﻿,
('Salesforce', 'Salesforce Certified UNKNOWN3')﻿,
('Salesforce', 'Salesforce Certified UNKNOWN4')﻿,
('Salesforce', 'Salesforce.com Certified Administrator (SU14)')﻿,
('SAP', 'IBM Design Thinking Practitioner')﻿,
('SAP', 'SAP Design Thinking')﻿,
('Siebel', 'Siebel 8.0 Certified Expert')﻿,
('SOA', 'IBM SOA Associate')﻿,
('Solaris', 'UNIX  -  Fundamentals of Solaris EU-116')﻿,
('Solaris', 'UNIX  -  Solaris for Advanced Users EU-170')﻿,
('SQL', 'The complete Oracle SQL Certification (Udemy)')﻿,
('SQL Server', 'Certified for Designing Microsoft BI Solutions with SQL Server 2014')﻿,
('Trailhead', 'Brand Alignment in Distributed Organizations')﻿,
('Trailhead', 'Distributed Marketing Administration')﻿,
('Trailhead', 'Marketing Cloud Basic')﻿,
('Trailhead', 'Marketing Cloud Connect')﻿,
('Trailhead', 'Marketing Cloud Email Specialist Certification Maintenance (Spring \'18)')﻿,
('Trailhead', 'Marketing Cloud Studios & Builders')﻿,
('Trailhead', 'Marketing Content Creation')﻿,
('Trifacta', 'Knight Certification')﻿,
('Trifacta', 'Wrangler Certification')﻿,
('UIPath', 'UiPath Business Analyst')﻿,
('UIPath', 'UIPath Foundation Certificate')﻿,
('UIPath', 'UiPath Foundation Training')﻿,
('UIPath', 'UiPath Implementation Manager')﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `certification_employee`
--

CREATE TABLE `certification_employee` (
  `ID_E` int(11) NOT NULL,
  `C_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `Issued_Date` date DEFAULT NULL,
  `Expires_Date` date DEFAULT NULL,
  `Issued_Year` int(4) NOT NULL DEFAULT 2000
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `certification_employee`
--

﻿INSERT INTO `certification_employee` (`ID_E`, `C_Name`, `Issued_Date`, `Expires_Date`, `Issued_Year`) VALUES
(1211, 'API Design and Fundamentals of Google Cloud\'s Apigee API Platform (con Honores)', '2019-10-23', '2019-10-26', 2019)﻿,
(2617, 'SAP Design Thinking', '2015-01-01', '0000-00-00', 2015)﻿,
(3116, 'CCA Spark and Hadoop Developer', '0000-00-00', '0000-00-00', 2000)﻿,
(3116, 'CCP Data Engineer', '0000-00-00', '0000-00-00', 2000)﻿,
(3116, 'Cloudera Certified Developer for Apache Hadoop CCD-470 (CDH4)', '0000-00-00', '0000-00-00', 2000)﻿,
(3116, 'Confluent Certified Developer for Apache Kafka', '2018-11-01', '2020-11-01', 2018)﻿,
(3116, 'Project Management Professional (PMP)', '0000-00-00', '0000-00-00', 2000)﻿,
(3116, 'Sun Certified Java Programmer (SCJP)', NULL, NULL, 2000)﻿,
(3688, 'Certified Scrum Master', '2008-11-01', '0000-00-00', 2008)﻿,
(3688, 'Project Management Professional (PMP)', '2007-10-01', '2014-10-01', 2007)﻿,
(7962, 'R3 Corda Certified Developer', '0000-00-00', '0000-00-00', 2000)﻿,
(33505, 'Salesforce Certified Developer (401)', '2013-07-01', '0000-00-00', 2013)﻿,
(33505, 'Salesforce Certified Integration Architecture Designer', '2017-03-01', '0000-00-00', 2017)﻿,
(33505, 'Salesforce Certified Platform App Builder', '2017-09-01', '0000-00-00', 2017)﻿,
(71595, 'CCA Spark and Hadoop Developer', '2017-04-01', '0000-00-00', 2017)﻿,
(71595, 'CCP Data Engineer', '2017-10-01', '2020-10-01', 2017)﻿,
(71595, 'Professional Scrum Master I - Scrum.org', '2018-01-01', '0000-00-00', 2018)﻿,
(102111, 'Scrum Master SCM', '0000-00-00', '0000-00-00', 2000)﻿,
(102324, 'MCSD: App Builder', '0000-00-00', '0000-00-00', 2000)﻿,
(102324, 'MCSD: Web Applications Solutions Developer', '2013-07-01', '2017-10-01', 2013)﻿,
(102324, 'MCTS: Programming in HTML5 with JavaScript and CSS3', '2013-02-01', '0000-00-00', 2013)﻿,
(102324, 'Microsoft Certified Solutions Associate: Cloud Platform', '2017-05-01', '2019-05-01', 2017)﻿,
(102324, 'Microsoft Specialist: Developing Microsoft Azure Solutions', '2017-05-01', '2019-05-01', 2017)﻿,
(102324, 'Microsoft Specialist: Implementing Microsoft Azure Infrastructure Solutions', '2017-03-01', '2019-03-01', 2017)﻿,
(102324, 'MuleSoft Certified Developer - API Design Associate', '2018-12-01', '2020-12-01', 2018)﻿,
(102324, 'TS: Web Applications Development with Microsoft .NET Framework 4', '2013-04-01', '0000-00-00', 2013)﻿,
(108466, 'API Design and Fundamentals of Google Cloud\'s Apigee API Platform (con Honores)', '2018-08-01', '0000-00-00', 2018)﻿,
(108466, 'API Development on Google Cloud\'s Apigee API Platform (con Honores)', '2018-10-01', '0000-00-00', 2018)﻿,
(108466, 'API Security on Google Cloud\'s Apigee API Platform (con Honores)', '2018-11-01', '0000-00-00', 2018)﻿,
(108466, 'Confluent Certified Developer for Apache Kafka', '2018-11-01', '2020-11-01', 2018)﻿,
(108466, 'Developing APIs with Google Cloud\'s Apigee API Platform', '2018-11-01', '0000-00-00', 2018)﻿,
(108466, 'Install and Manage Google Cloud\'s Apigee API Platform', '2019-02-01', '0000-00-00', 2019)﻿,
(108466, 'On Premises Capacity Upgrade and Monitoring with Google Cloud\'s Apigee API Platform', '2019-02-01', '0000-00-00', 2019)﻿,
(108466, 'On Premises Installation and Fundamentals with Google Cloud\'s Apigee API Platform', '2019-02-01', '0000-00-00', 2019)﻿,
(108466, 'On Premises Management, Security, and Upgrade with Google Cloud\'s Apigee API Platform', '2019-02-01', '0000-00-00', 2019)﻿,
(119984, 'Java Programmer I', '2014-10-01', '0000-00-00', 2014)﻿,
(119984, 'Java Programmer II', '2015-09-01', '0000-00-00', 2015)﻿,
(119984, 'Mulesoft Certified Developer (MCD)', '2018-11-01', '0000-00-00', 2018)﻿,
(120460, 'AWS Certified Cloud Practitioner', '2019-02-01', '2021-02-01', 2019)﻿,
(120460, 'MuleSoft Certified Platform Architect - Level 1', '2019-08-01', '2021-08-01', 2019)﻿,
(121284, 'Certified Scrum Master', '2016-03-01', '2018-03-01', 2016)﻿,
(121284, 'R3 Corda Certified Developer', '2019-01-01', '0000-00-00', 2019)﻿,
(121908, 'CCA Spark and Hadoop Developer', '2018-03-01', '2020-03-01', 2018)﻿,
(122139, 'MuleSoft Certified Developer - API Design Associate (RAML 1.0)', '2018-12-01', '2020-12-01', 2018)﻿,
(122139, 'R3 Corda Certified Developer', '2018-10-01', '0000-00-00', 2018)﻿,
(123980, 'SAP Design Thinking', '2016-09-01', '0000-00-00', 2016)﻿,
(124361, 'CCA Spark and Hadoop Developer', '2017-03-01', '2017-04-01', 2017)﻿,
(125219, 'CCA Spark and Hadoop Developer', '2017-01-01', '0000-00-00', 2017)﻿,
(125219, 'CCP Data Engineer', '2017-09-01', '2020-01-01', 2017)﻿,
(125219, 'Wrangler Certification', '2019-01-01', '2021-01-01', 2019)﻿,
(126732, 'Shaping up with angularJS', '2015-02-01', '0000-00-00', 2015)﻿,
(132951, 'CCA Spark and Hadoop Developer', '2017-04-01', '0000-00-00', 2017)﻿,
(135028, 'CCA Spark and Hadoop Developer', '2018-05-01', '2020-01-01', 2018)﻿,
(136513, 'MuleSoft Certified Developer - API Design Associate (RAML 1.0)', '0000-00-00', '0000-00-00', 2000)﻿,
(136513, 'Programming in HTML5 with JavaScript and CSS3', '2018-04-01', '0000-00-00', 2018)﻿,
(138577, 'CCA Spark and Hadoop Developer', '0000-00-00', '0000-00-00', 2000)﻿,
(140070, 'Confluent Certified Developer for Apache Kafka', '2019-05-01', '0000-00-00', 2019)﻿,
(144556, 'Developer ADO.NET 2003', '0000-00-00', '0000-00-00', 2000)﻿,
(144556, 'Developer ASP.NET 2003', '0000-00-00', '0000-00-00', 2000)﻿,
(144556, 'Developer Visual Basic .NET 2003', '0000-00-00', '0000-00-00', 2000)﻿,
(144556, 'Implementation SQL Server 2008', '0000-00-00', '0000-00-00', 2000)﻿,
(144556, 'Maintenance SQL Server 2008', '0000-00-00', '0000-00-00', 2000)﻿,
(144556, 'Microstrategy for Business Intelligence', '2012-07-01', '0000-00-00', 2012)﻿,
(144861, 'Platform Fundamentals for Developers Rel 11.1', '2016-05-01', '0000-00-00', 2016)﻿,
(144861, 'Shaping up with angularJS', '0000-00-00', '0000-00-00', 2000)﻿,
(147887, 'Big Data (2015) Specialisation (Coursera)', '2016-10-01', '0000-00-00', 2016)﻿,
(147887, 'CCA Spark and Hadoop Developer', '2017-04-01', '0000-00-00', 2017)﻿,
(147887, 'CCP Data Engineer', '2017-08-01', '0000-00-00', 2017)﻿,
(147887, 'Confluent Certified Developer for Apache Kafka', '2018-12-01', '0000-00-00', 2018)﻿,
(147887, 'Graph Analytics for Big Data (Coursera)', '2016-03-01', '0000-00-00', 2016)﻿,
(147887, 'Hadoop Platform and Application Framework (Coursera)', '2015-12-01', '0000-00-00', 2015)﻿,
(147887, 'HDP Certified Developer', '2017-07-01', '0000-00-00', 2017)﻿,
(147887, 'Introduction to Big Data (Coursera)', '2015-11-01', '0000-00-00', 2015)﻿,
(147887, 'Introduction to Big Data Analytics (Coursera)', '2016-01-01', '0000-00-00', 2016)﻿,
(147887, 'Machine Learning with Big Data (Coursera)', '2016-02-01', '0000-00-00', 2016)﻿,
(147887, 'O\'Reilly Development Certification for Apache Kafka', '2017-05-01', '0000-00-00', 2017)﻿,
(147887, 'Professional Scrum Master', '2017-12-01', '0000-00-00', 2017)﻿,
(149600, 'MCPS: Microsoft Certified Professional', '2012-04-01', '0000-00-00', 2012)﻿,
(149600, 'MCTS: .NET Framework 3.5 Windows Forms applications', '2009-07-01', '0000-00-00', 2009)﻿,
(151662, 'Deep Learning Specialization', '2018-10-01', '0000-00-00', 2018)﻿,
(151662, 'Neo4j Certification', '2019-07-01', '0000-00-00', 2019)﻿,
(151662, 'Wrangler Certification', '2019-01-01', '2021-01-01', 2019)﻿,
(152838, 'Blue Prism Developer Accreditation Certificate of Excellence', '2017-04-01', '0000-00-00', 2017)﻿,
(152838, 'Process Mining: Data science in Action', '2017-02-01', '0000-00-00', 2017)﻿,
(152838, 'UIPath Foundation Certificate', '2019-03-01', '0000-00-00', 2019)﻿,
(154981, 'Professional Scrum Master', '2017-11-01', '0000-00-00', 2017)﻿,
(154981, 'SCRUM - Six Sigma Yellow Belt', '2005-07-01', '0000-00-00', 2005)﻿,
(154981, 'Scrum Fundamentals Certified', '2005-07-01', '0000-00-00', 2005)﻿,
(157822, 'Google Apigee API Engineer', '2018-12-01', '0000-00-00', 2018)﻿,
(157822, 'IBM SOA Associate', '2007-01-01', '0000-00-00', 2007)﻿,
(157822, 'Knight Certification', '2019-01-01', '2021-01-01', 2019)﻿,
(160862, 'CCA Spark and Hadoop Developer', '2018-05-01', '2020-01-01', 2018)﻿,
(162133, 'UiPath Business Analyst', '2019-05-01', '0000-00-00', 2019)﻿,
(162133, 'UiPath Foundation Training', '2019-05-01', '0000-00-00', 2019)﻿,
(162133, 'UiPath Implementation Manager', '2019-05-01', '0000-00-00', 2019)﻿,
(162149, 'MongoDB for DBAs', '2014-01-01', '0000-00-00', 2014)﻿,
(162149, 'MongoDB for Java Developers', '2013-12-01', '0000-00-00', 2013)﻿,
(162149, 'Mulesoft Certified Developer (MCD)', '2019-03-01', '0000-00-00', 2019)﻿,
(162149, 'Pattern Discovery in Data Mining', '2015-03-01', '0000-00-00', 2015)﻿,
(162149, 'R Programming (Coursera)', '2015-03-01', '0000-00-00', 2015)﻿,
(164292, 'Salesforce Certified Administrator', '2018-06-01', '0000-00-00', 2018)﻿,
(167789, 'Certified Scrum Master', '2015-01-01', '2022-01-01', 2015)﻿,
(167789, 'IBM Blockchain Essentials', '2018-01-01', '0000-00-00', 2018)﻿,
(167789, 'IBM Design Thinking Practitioner', '2016-07-01', '0000-00-00', 2016)﻿,
(167789, 'Salesforce App Builder', '2019-09-01', '0000-00-00', 2019)﻿,
(167789, 'Salesforce Certified Administrator (SCA)', '2018-11-01', '0000-00-00', 2018)﻿,
(167789, 'Salesforce Certified Service Cloud Consultant', '2018-12-01', '0000-00-00', 2018)﻿,
(167789, 'Siebel 8.0 Certified Expert', '2009-01-01', '0000-00-00', 2009)﻿,
(168931, 'Quote to Cash Certification', '2015-10-01', '0000-00-00', 2015)﻿,
(168931, 'Salesforce Certified Sales Cloud Consultant (SP15)', '2015-06-01', '0000-00-00', 2015)﻿,
(168931, 'Salesforce.com Certified Administrator (SU14)', '2014-08-01', '0000-00-00', 2014)﻿,
(168933, 'Correlation and Regression', '0000-00-00', '0000-00-00', 2000)﻿,
(168933, 'Data Manipulation in R (DataCamp)', '0000-00-00', '0000-00-00', 2000)﻿,
(168933, 'Introduction to Machine Learning (DataCamp)', '0000-00-00', '0000-00-00', 2000)﻿,
(168933, 'Microsoft Azure Core Functionalities', '0000-00-00', '0000-00-00', 2000)﻿,
(168933, 'Microsoft Azure for Developers', '0000-00-00', '0000-00-00', 2000)﻿,
(168933, 'Power BI Pro Essential (LinkedIn)', '0000-00-00', '0000-00-00', 2000)﻿,
(168933, 'Tableau 10 Essential', '0000-00-00', '0000-00-00', 2000)﻿,
(168933, 'The complete Oracle SQL Certification (Udemy)', '0000-00-00', '0000-00-00', 2000)﻿,
(169230, 'Brand Alignment in Distributed Organizations', '2018-01-01', '0000-00-00', 2018)﻿,
(169230, 'Distributed Marketing Administration', '2018-01-01', '0000-00-00', 2018)﻿,
(169230, 'Marketing Cloud Basic', '2018-01-01', '0000-00-00', 2018)﻿,
(169230, 'Marketing Cloud Connect', '2018-01-01', '0000-00-00', 2018)﻿,
(169230, 'Marketing Cloud Email Specialist Certification Maintenance (Spring \'18)', '2018-04-01', '0000-00-00', 2018)﻿,
(169230, 'Marketing Cloud Studios & Builders', '2018-01-01', '0000-00-00', 2018)﻿,
(169230, 'Marketing Content Creation', '2018-01-01', '0000-00-00', 2018)﻿,
(169230, 'Salesforce Certified Marketing Cloud Email Specialist (SP18)', '2018-04-01', '0000-00-00', 2018)﻿,
(170790, 'Certified for Designing Microsoft BI Solutions with SQL Server 2014', '0000-00-00', '0000-00-00', 2000)﻿,
(170790, 'Certified for Microsoft Dynamics CRM 2011 (CRM 2011)', '0000-00-00', '0000-00-00', 2000)﻿,
(170790, 'Certified PRINCE2 Practitioner', '0000-00-00', '0000-00-00', 2000)﻿,
(170790, 'Level 5 Certificate in Coaching and Mentoring (Institute for Leadership and Management)', '0000-00-00', '0000-00-00', 2000)﻿,
(170790, 'Salesforce Certified Pardot Specialist (SP18)', '0000-00-00', '0000-00-00', 2000)﻿,
(170790, 'Salesforce Certified Technical Architect', '0000-00-00', '0000-00-00', 2000)﻿,
(170790, 'Salesforce Certified UNKNOWN1', '0000-00-00', '0000-00-00', 2000)﻿,
(170790, 'Salesforce Certified UNKNOWN2', '0000-00-00', '0000-00-00', 2000)﻿,
(170790, 'Salesforce Certified UNKNOWN3', '0000-00-00', '0000-00-00', 2000)﻿,
(170790, 'Salesforce Certified UNKNOWN4', '0000-00-00', '0000-00-00', 2000)﻿,
(171392, 'Exam 534: Architecting Microsoft Azure Solutions', '2016-10-01', '0000-00-00', 2016)﻿,
(173642, 'Advanced CSS and SASS (Udemy)', '2018-03-01', '0000-00-00', 2018)﻿,
(173642, 'Sass Workflow (Udemy)', '2018-03-01', '0000-00-00', 2018)﻿,
(173642, 'The Complete React Web Developer Course (with Redux)', '2018-04-01', '0000-00-00', 2018)﻿,
(174510, 'HTML, CSS and Javascript (Cambridge Certification Authority)', '2018-07-01', '0000-00-00', 2018)﻿,
(174510, 'Multiplatform Mobile App Development and other series of front-end and server-side courses (The Hong Kong University of Science and Technology on Coursera)', '2018-09-01', '0000-00-00', 2018)﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `certification_path`
--

CREATE TABLE `certification_path` (
  `K_A_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `C_P_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `certification_path`
--

﻿INSERT INTO `certification_path` (`K_A_Name`, `C_P_Name`) VALUES
('API & Integration', 'Apigee')﻿,
('API & Integration', 'AWS')﻿,
('API & Integration', 'Mulesoft')﻿,
('API & Integration', 'SOA')﻿,
('Big Data', 'Cloudera')﻿,
('Big Data', 'Confluent')﻿,
('Big Data', 'Hortonworks')﻿,
('Big Data', 'Neo4j')﻿,
('Big Data', 'Trifacta')﻿,
('Blockchain', 'Corda')﻿,
('Blockchain', 'IBM - Blockchain')﻿,
('Business Intelligence', 'Microsoft - Business Intelligence')﻿,
('Business Intelligence', 'Microstrategy')﻿,
('Cloud', 'Microsoft - Cloud')﻿,
('Database', 'MongoDB')﻿,
('Database', 'Oracle')﻿,
('Database', 'Siebel')﻿,
('Database', 'SQL Server')﻿,
('Governance', 'Enterprise Architecture')﻿,
('Governance', 'Project Management - Governance')﻿,
('Infrastructure', 'Solaris')﻿,
('Management', 'Agile/Management')﻿,
('Management', 'Project Management - Management')﻿,
('ML/IA', 'ML/IA')﻿,
('Portals/CMS', 'Liferay')﻿,
('Programming', 'AngularJS')﻿,
('Programming', 'Java')﻿,
('Programming', 'Microsoft - Programming')﻿,
('Programming', 'Natural')﻿,
('Programming', 'Perl')﻿,
('Programming', 'SQL')﻿,
('RPA', 'BluePrism')﻿,
('RPA', 'UIPath')﻿,
('SaaS', 'Apttus')﻿,
('SaaS', 'Microsoft - Saas')﻿,
('Salesforce', 'Salesforce')﻿,
('Salesforce', 'Trailhead')﻿,
('UX/UI Design', 'Front-End')﻿,
('UX/UI Design', 'IBM - UX/UI Design')﻿,
('UX/UI Design', 'SAP')﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID_E` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `Surname` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `Office` varchar(255) COLLATE utf16_unicode_ci DEFAULT NULL,
  `Business_Unit` varchar(255) COLLATE utf16_unicode_ci DEFAULT NULL,
  `Service_Line` varchar(255) COLLATE utf16_unicode_ci DEFAULT NULL,
  `Generic_Category` varchar(255) COLLATE utf16_unicode_ci DEFAULT NULL,
  `Category` varchar(255) COLLATE utf16_unicode_ci DEFAULT NULL,
  `Safari_Books_Online` date DEFAULT NULL,
  `N_Certifications` int(11) NOT NULL,
  `Req_Manual_Check` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `employee`
--

﻿INSERT INTO `employee` (`ID_E`, `Name`, `Surname`, `Office`, `Business_Unit`, `Service_Line`, `Generic_Category`, `Category`, `Safari_Books_Online`, `N_Certifications`, `Req_Manual_Check`) VALUES
(1211, 'Borja', 'Ochoa', 'London', 'Technology', 'Data & Analytics', 'Manager', 'M-N1', '2018-10-01', 0, 1)﻿,
(2617, 'Arnau', 'Rovira', 'London', 'Technology', 'Digital Experience', 'Manager', 'M-N1', NULL, 1, 0)﻿,
(3116, 'Manuel', 'Pando Mones', 'London', 'Technology', 'Digital Architecture', 'Leader', 'SKL-N2', '2017-10-18', 6, 0)﻿,
(3688, 'Cesar', 'Zayas', 'London', 'Technology', 'Technology', 'Partner', 'PARTNER', '2017-02-06', 2, 0)﻿,
(7962, 'Helena', 'Marques', 'London', 'Technology', 'Digital Architecture', 'Manager', 'M-N1', NULL, 0, 1)﻿,
(32152, 'Alberto', 'Gimenez', 'London', 'Technology', 'Digital Architecture', 'Director', 'D-N1', NULL, 0, 1)﻿,
(33505, 'Carlos', 'Hernandez', 'London', 'Technology', 'ECS/Salesforce', 'Staff', 'SK-N1', NULL, 3, 0)﻿,
(71595, 'Eugenio', 'Rodriguez', 'London', 'Technology', 'Data & Analytics', 'Leader', 'SKL-N1', NULL, 3, 0)﻿,
(102111, 'David', 'Porto', 'London', 'Technology', 'Data & Analytics', 'Leader', 'SKL-N2', NULL, 1, 0)﻿,
(102324, 'Sergio', 'Sisternes', 'London', 'Technology', 'Digital Architecture', 'Manager', 'M-N1', NULL, 8, 0)﻿,
(104956, 'Luis', 'Moreno', 'London', 'Technology', 'Digital Experience', 'Director', 'D-N1', NULL, 0, 1)﻿,
(108466, 'Antonio', 'Costa', 'London', 'Technology', 'Digital Architecture', 'Leader', 'SKL-N1', '2018-01-08', 9, 0)﻿,
(119626, 'Joan', 'Fuerte', 'London', 'Technology', 'Data & Analytics', 'Leader', 'SKL-N1', '2019-06-04', 0, 0)﻿,
(119984, 'Ariel Dario', 'Cassan', 'London', 'Technology', 'Digital Architecture', 'Manager', 'M-N1', '2018-12-07', 4, 0)﻿,
(120460, 'Miguel Angel', 'Chuecos Piera', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N1', NULL, 7, 0)﻿,
(120854, 'João', 'Sena', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SN-N1', '2018-12-13', 0, 0)﻿,
(121070, 'Ferran', 'Bernal', 'London', 'Technology', 'Digital Experience', 'Leader', 'SKL-N1', '2019-03-20', 1, 0)﻿,
(121284, 'Pablo', 'Aldana', 'London', 'Technology', 'Digital Architecture', 'Leader', 'SKL-N1', NULL, 2, 0)﻿,
(121908, 'Diogo', 'Pinto', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N1', NULL, 1, 0)﻿,
(122139, 'Jose Javier', 'Lirio', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SN-N1', '2018-07-19', 2, 0)﻿,
(123980, 'Marcel', 'Pallares', 'London', 'Technology', 'Digital Experience', 'Staff', 'SK-N1', NULL, 1, 0)﻿,
(124361, 'Sergio', 'Plaza Ruiz', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N2', '2018-12-20', 2, 0)﻿,
(124945, 'Jordi', 'Serra', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SN-N1', '2019-04-03', 0, 0)﻿,
(125219, 'Adrian', 'Gonzalez', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N2', '2018-12-13', 4, 0)﻿,
(126732, 'Miguel', 'Lirio', 'London', 'Technology', 'Digital Experience', 'Staff', 'SN-N1', '2019-08-12', 1, 0)﻿,
(127076, 'Juan Carlos', 'Gallardo', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SN-N1', NULL, 0, 0)﻿,
(127625, 'Maria Jesus', 'Crespo', 'London', 'Technology', 'Data & Analytics', 'Leader', 'SKL-N1', NULL, 0, 1)﻿,
(127782, 'Sergio', 'Gonzalez', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SN-N1', NULL, 0, 1)﻿,
(128815, 'Maria', 'L?pez', 'London', 'Technology', 'Digital Experience', 'Leader', 'SKL-N1', NULL, 0, 0)﻿,
(131797, 'Ricard', 'Creus Freixas', 'London', 'Technology', 'Digital Experience', 'Staff', 'SN-N1', NULL, 0, 0)﻿,
(132882, 'Alberto', 'Martinez', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N1', NULL, 0, 0)﻿,
(132951, 'Jitesh', 'Pramodray', 'London', 'Technology', 'Data & Analytics', 'Leader', 'SKL-N1', NULL, 1, 0)﻿,
(134013, 'Brendan', 'Moore', 'London', 'Technology', 'Data & Analytics', 'Leader', 'SKL-N1', NULL, 6, 0)﻿,
(134836, 'Eudes', 'Ochoa', 'London', 'Technology', 'Digital Experience', 'Staff', 'SN-N1', NULL, 0, 0)﻿,
(135028, 'Javier', 'Galarza', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SN-N1', NULL, 1, 0)﻿,
(135932, 'Enric', 'Biosca', 'London', 'Technology', 'Data & Analytics', 'Manager', 'M-N1', NULL, 0, 1)﻿,
(136513, 'Pedro', 'Moura', 'London', 'Technology', 'Digital Architecture', 'Leader', 'SKL-N1', '2019-02-04', 3, 0)﻿,
(138577, 'Mauricio', 'Lins', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N2', NULL, 0, 1)﻿,
(138657, 'Francesco', 'Palmieri', 'Milton Keynes', 'Technology', 'Data & Analytics', 'Leader', 'STL-N1', NULL, 0, 0)﻿,
(140070, 'Ernesto', 'Mayoral', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SN-N1', NULL, 1, 0)﻿,
(143744, 'Jose Joaquín', 'Barrueco', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SN-N1', NULL, 0, 0)﻿,
(144556, 'Ivan', 'Alvarado', 'London', 'Technology', 'Data & Analytics', 'Leader', 'SKL-N1', NULL, 6, 0)﻿,
(144861, 'Enrique', 'Pantoja', 'London', 'Technology', 'Digital Architecture', 'Manager', 'M-N1', NULL, 2, 0)﻿,
(147887, 'Eloy', 'Valle', 'London', 'Technology', 'Data & Analytics', 'Leader', 'SKL-N1', '2018-10-26', 12, 0)﻿,
(149312, 'Marina', 'Padurean', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SN-N1', NULL, 0, 0)﻿,
(149600, 'Enrique', 'Loyola', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N2', '2018-12-20', 3, 0)﻿,
(150907, 'Aaron', 'Donoso', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N1', '2019-02-14', 0, 1)﻿,
(151486, 'Vicente', 'Pastor', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N1', NULL, 0, 1)﻿,
(151662, 'José Alejandro', 'Galisteo Callejón', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SA-N1', NULL, 3, 0)﻿,
(152838, 'Bruno', 'Esteves', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N1', NULL, 3, 0)﻿,
(154981, 'Geoffrey', 'Doran', 'London', 'Technology', 'Digital Experience', 'Manager', 'M-N1', NULL, 3, 0)﻿,
(156235, 'Austine', 'Esemiteye', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N1', NULL, 0, 0)﻿,
(157108, 'Robin', 'Whitwell', 'London', 'Technology', 'Data & Analytics', 'Leader', 'SKL-N1', '2018-12-20', 0, 1)﻿,
(157110, 'Raquel', 'Ruiz', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N1', NULL, 0, 0)﻿,
(157822, 'Darren', 'Kabengele', 'London', 'Technology', 'Digital Architecture', 'Leader', 'SKL-N1', NULL, 5, 0)﻿,
(158840, 'Inés', 'Pérez', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SN-N1', '2019-06-06', 1, 0)﻿,
(160029, 'Carlos', 'Soriano', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SN-N1', '2018-10-15', 0, 0)﻿,
(160862, 'Roman', 'Torres', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SN-N1', '2019-07-16', 1, 0)﻿,
(161973, 'Philip', 'Schofield', 'London', 'Technology', 'ECS/Salesforce', 'Director', 'D-N1', NULL, 0, 1)﻿,
(162133, 'Axel', 'Rubio', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N1', NULL, 3, 0)﻿,
(162149, 'Gregorio', 'Jiménez', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N2', NULL, 6, 0)﻿,
(162425, 'Juliet', 'Babb', 'London', 'Technology', 'Digital Architecture', 'Leader', 'SKL-N1', '2019-02-04', 1, 0)﻿,
(162551, 'Manuel', 'Valles', 'London', 'Technology', 'Digital Experience', 'Staff', 'SA-N1', '2019-02-15', 0, 0)﻿,
(164292, 'Ray', 'Foulkes', 'London', 'Technology', 'ECS/Salesforce', 'Staff', 'SK-N1', NULL, 1, 0)﻿,
(165511, 'Ana Catarina', 'Mateus', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N1', NULL, 0, 1)﻿,
(165742, 'David', 'Vaca', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SN-N1', NULL, 0, 1)﻿,
(167789, 'Paul', 'Blakey', 'London', 'Technology', 'ECS/Salesforce', 'Staff', 'SK-N1', NULL, 7, 0)﻿,
(168931, 'Prachi', 'Chauhan', 'London', 'Technology', 'ECS/Salesforce', 'Leader', 'SKL-N1', NULL, 3, 0)﻿,
(168933, 'Monika', 'Kastner', 'London', 'Technology', 'Digital Experience', 'Staff', 'SN-N1', '2018-12-07', 8, 0)﻿,
(169152, 'Angela', 'Maselli', 'London', 'Technology', 'Digital Experience', 'Staff', 'SA-N1', '2018-12-07', 0, 0)﻿,
(169230, 'Natarajan', 'Pillai', 'London', 'Technology', 'ECS/Salesforce', 'Staff', 'SN-N1', NULL, 9, 0)﻿,
(170790, 'Anjali', 'Subburaj', 'London', 'Technology', 'ECS/Salesforce', 'Leader', 'SKL-N2', NULL, 11, 0)﻿,
(170791, 'Lorena', 'Perez Verdasco', 'London', 'Technology', 'Digital Experience', 'Staff', 'SA-N1', NULL, 0, 0)﻿,
(171392, 'Richard', 'Fowles', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SN-N1', NULL, 1, 0)﻿,
(171395, 'Marco', 'Meneghini', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N2', NULL, 0, 0)﻿,
(172082, 'Venkateswar Rao', 'Ramineni', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N2', NULL, 0, 0)﻿,
(172734, 'Alejandro', 'P?rez', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SA-N1', NULL, 0, 0)﻿,
(173033, 'Dimitrios', 'Bestas', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SA-N1', '2019-03-25', 0, 0)﻿,
(173045, 'Wojciech', 'Worek', 'London', 'Technology', 'Digital Experience', 'Staff', 'SN-N1', '2019-04-01', 0, 0)﻿,
(173319, 'Irene', 'Tello', 'London', 'Technology', 'Digital Experience', 'Staff', 'SA-N1', '2019-03-05', 0, 0)﻿,
(173642, 'Stephanie', 'Senoner', 'London', 'Technology', 'Digital Experience', 'Staff', 'SN-N1', '2019-03-20', 3, 0)﻿,
(174510, 'Dorina', 'Mihai', 'London', 'Technology', 'Digital Experience', 'Staff', 'SN-N1', NULL, 2, 0)﻿,
(174706, 'Miguel', 'Orba?anos', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SN-N1', '2019-05-30', 0, 0)﻿,
(174970, 'Mitali', 'Pagote', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N1', '2019-07-16', 0, 1)﻿,
(175203, 'Sara', 'Solis', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SA-N1', NULL, 0, 0)﻿,
(175317, 'Khurram', 'Darugar', 'London', 'Technology', 'Digital Experience', 'Staff', 'SK-N2', NULL, 0, 1)﻿,
(176296, 'Patrick', 'Izekor', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SK-N1', NULL, 0, 0)﻿,
(176767, 'Craig', 'Cattell', 'London', 'Technology', 'Digital Experience', 'Staff', 'SK-N2', NULL, 0, 0)﻿,
(177153, 'Francisco ', 'Reina Ponce', 'London', 'Technology', 'Digital Experience', 'Staff', 'SA-N1', NULL, 0, 0)﻿,
(177498, 'Cengiz', 'Kayay', 'London', 'Technology', 'Digital Architecture', 'Leader', 'SKL-N2', '2019-07-30', 0, 1)﻿,
(178415, 'Pedro', 'Coelho', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N1', NULL, 0, 1)﻿,
(178938, 'Diana', 'Gallego', 'London', 'Technology', 'Digital Architecture', 'Leader', 'SKL-N1', NULL, 0, 1)﻿,
(180115, 'Alvaro', 'Elorza Luquero', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N1', NULL, 0, 1)﻿,
(180243, 'Megha', 'Gupta', 'London', 'Technology', 'Digital Experience', 'Staff', 'SK-N1', NULL, 0, 1)﻿,
(180321, 'Michal', 'Zbikowski', 'London', 'Technology', 'Data & Analytics', 'Staff', 'SK-N1', NULL, 0, 1)﻿,
(180581, 'Anmol', 'Nandha', 'London', 'Technology', 'Digital Experience', 'Leader', 'SKL-N1', '2019-10-14', 0, 1)﻿,
(180715, 'Pablo', 'Mina', 'London', 'Technology', 'Digital Architecture', 'Leader', 'SKL-N1', NULL, 0, 1)﻿,
(181035, 'Hakan', 'Gonen', 'London', 'Technology', 'Digital Experience', 'Staff', 'SK-N1', '2019-10-14', 0, 1)﻿,
(181233, 'Jose', 'Llopis Zapata', 'London', 'Technology', 'Digital Architecture', 'Staff', 'SA-N1', NULL, 0, 1)﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `generic_category`
--

CREATE TABLE `generic_category` (
  `G_CAT_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `generic_category`
--

﻿INSERT INTO `generic_category` (`G_CAT_Name`) VALUES
('Director')﻿,
('Leader')﻿,
('Manager')﻿,
('Partner')﻿,
('Staff')﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `knowledge_area`
--

CREATE TABLE `knowledge_area` (
  `K_A_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `knowledge_area`
--

﻿INSERT INTO `knowledge_area` (`K_A_Name`) VALUES
('API & Integration')﻿,
('Big Data')﻿,
('Blockchain')﻿,
('Business Intelligence')﻿,
('Cloud')﻿,
('Database')﻿,
('Governance')﻿,
('Infrastructure')﻿,
('Management')﻿,
('ML/IA')﻿,
('Portals/CMS')﻿,
('Programming')﻿,
('RPA')﻿,
('SaaS')﻿,
('Salesforce')﻿,
('UX/UI Design')﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `O_Location` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `office`
--

﻿INSERT INTO `office` (`O_Location`) VALUES
('London')﻿,
('Milton Keynes')﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `service_line`
--

CREATE TABLE `service_line` (
  `Service_Name` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
﻿
--
-- Dumping data for table `service_line`
--

﻿INSERT INTO `service_line` (`Service_Name`) VALUES
('Data & Analytics')﻿,
('Digital Architecture')﻿,
('Digital Experience')﻿,
('ECS/Salesforce')﻿,
('Technology')﻿;
﻿
--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_unit`
--
ALTER TABLE `business_unit`
  ADD PRIMARY KEY (`B_U_Name`),
  ADD KEY `B_U_Name` (`B_U_Name`);

--
-- Indexes for table `category_employee`
--
ALTER TABLE `category_employee`
  ADD PRIMARY KEY (`CAT_Name`),
  ADD KEY `CAT_Name` (`CAT_Name`);

--
-- Indexes for table `certification`
--
ALTER TABLE `certification`
  ADD PRIMARY KEY (`C_P_Name`,`C_Name`),
  ADD KEY `C_P_Name` (`C_P_Name`),
  ADD KEY `C_Name` (`C_Name`);

--
-- Indexes for table `certification_employee`
--
ALTER TABLE `certification_employee`
  ADD PRIMARY KEY (`ID_E`,`C_Name`),
  ADD KEY `ID_E` (`ID_E`),
  ADD KEY `C_Name` (`C_Name`);

--
-- Indexes for table `certification_path`
--
ALTER TABLE `certification_path`
  ADD PRIMARY KEY (`K_A_Name`,`C_P_Name`),
  ADD KEY `C_P_Name` (`C_P_Name`),
  ADD KEY `K_A_Name` (`K_A_Name`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID_E`),
  ADD KEY `Office` (`Office`),
  ADD KEY `Business_Unit` (`Business_Unit`),
  ADD KEY `Service_Line` (`Service_Line`),
  ADD KEY `Generic_Category` (`Generic_Category`),
  ADD KEY `Category` (`Category`);

--
-- Indexes for table `generic_category`
--
ALTER TABLE `generic_category`
  ADD PRIMARY KEY (`G_CAT_Name`),
  ADD KEY `G_CAT_Name` (`G_CAT_Name`);

--
-- Indexes for table `knowledge_area`
--
ALTER TABLE `knowledge_area`
  ADD PRIMARY KEY (`K_A_Name`),
  ADD KEY `K_A_Name` (`K_A_Name`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`O_Location`),
  ADD KEY `O_Location` (`O_Location`);

--
-- Indexes for table `service_line`
--
ALTER TABLE `service_line`
  ADD PRIMARY KEY (`Service_Name`),
  ADD KEY `Service_Name` (`Service_Name`);
﻿
--
-- Constraints for dumped tables
--

--
-- Constraints for table `certification`
--
ALTER TABLE `certification`
  ADD CONSTRAINT `certification_ibfk_1` FOREIGN KEY (`C_P_Name`) REFERENCES `certification_path` (`C_P_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `certification_employee`
--
ALTER TABLE `certification_employee`
  ADD CONSTRAINT `certification_employee_ibfk_1` FOREIGN KEY (`ID_E`) REFERENCES `employee` (`ID_E`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `certification_path`
--
ALTER TABLE `certification_path`
  ADD CONSTRAINT `certification_path_ibfk_1` FOREIGN KEY (`K_A_Name`) REFERENCES `knowledge_area` (`K_A_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Office`) REFERENCES `office` (`O_Location`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Office`) REFERENCES `office` (`O_Location`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`Business_Unit`) REFERENCES `business_unit` (`B_U_Name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`Generic_Category`) REFERENCES `generic_category` (`G_CAT_Name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`Category`) REFERENCES `category_employee` (`CAT_Name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_6` FOREIGN KEY (`Service_Line`) REFERENCES `service_line` (`Service_Name`) ON DELETE SET NULL ON UPDATE CASCADE;
﻿COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
