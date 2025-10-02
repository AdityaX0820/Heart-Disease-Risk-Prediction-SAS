/**************************************** 1. IMPORT DATA ********************************************/

/*	a.	Import your dataset into a permanent user-defined library in the SAS environment.	*/

/*	b.	If using PROC IMPORT, make sure to include the code you used in your SAS file (not the actual report pdf).	*/

/* Create a permanent library */
libname heart 'C:\Users\akhil\OneDrive\Desktop\SAS\Project\Heart';

/* Import the dataset */
proc import datafile='C:\Users\akhil\OneDrive\Desktop\SAS\Project\Heart\heart_disease_uci.csv'
    out=heart.heart_data
    dbms=csv
    replace;
    getnames=yes;
run;

/*	Check for missing values unknown values, and incorrect data type.	*/
title1 'Checking for missing values, unknown values, and incorrect data type';
proc means data=heart.heart_data nmiss n mean std min max;
run;title1;

/*	Dropping the attributes that won't be needed.	*/
data heart.heart_diseases ( drop = oldpeak) ;
	set heart.heart_data;
run;

/**************************************** 2. DATA EXPLORATION ********************************************/

/*	a.	Use PROC CONTENTS to explore your data and produce descriptive information about the variables contained in your dataset.	*/


/* Use PROC CONTENTS to explore the data */
proc contents data=heart.heart_diseases;
run;

/**************************************** 3. LABELS ********************************************/

/*	a.	Create intuitive, permanent labels for all variables included in your report.	*/

/* Assign intuitive labels to the variables */
data heart.heart_data_labeled;
    set heart.heart_diseases;
    label id="Unique ID"
          age="Age of Patient"
          origin="Place of Study"
          sex="Sex of Patient"
          cp="Chest Pain Type"
          trestbps="Resting Blood Pressure"
          chol="Serum Cholesterol"
          fbs="Fasting Blood Sugar >120 mg/dl"
          restecg="Resting Electrocardiographic Results"
          thalch="Maximum Heart Rate Achieved"
          exang="Exercise-Induced Angina"
          slope="Slope of Peak ST Segment"
          thal="Thalassemia Results"
		  ca="Number of major vessels colored by fluoroscopy"
          num="The Disease predicting attribute";
run;

/**************************************** 4. FORMATS ********************************************/

/*	a.	Create formats for all categorical and date variable data included in your report.	*/


/* Define formats for categorical variables */
proc format;
    value numfmt 0='No Disease' 1='Less chance of Disease' 2='Medium chance of Disease' 3='Highe chance of Disease' 4='Very High chance of Disease';
	value $sexfmt 'Male'='M' 'Female'='F';
	value $fbsfmt 'TRUE'='T' 'FALSE'='F';
	value $exangfmt 'TRUE'='T' 'FALSE'='F';
run;

/* Apply formats */
data heart.heart_data_formatted;
    set heart.heart_data_labeled;
    format num numfmt. sex sexfmt. fbs fbsfmt. exang fbsfmt.;
run;

/* Sort data by ID and print the first 10 observations */
proc sort data=heart.heart_data_formatted out=heart.sorted_data;
    by id;
run;

proc print data=heart.sorted_data(obs=10) noobs;
    var id age sex cp trestbps chol fbs restecg exang thalch slope thal ca num;
    title "First 10 Observations of Heart Data";
run;title;

/**************************************** 6. SUBSETTING ********************************************/

/*	a.	Use at least (1) DATA Step to subset data based on a set of conditions you specify using IF and THEN statements or WHERE statements. 
	b.	Only output variables into the new output dataset that will be used in your report.	*/

/* Subset data where age > 50 and create a new dataset */
data heart.subset_data;
    set heart.heart_data_formatted;
    where age > 50 and chol > 200;
	keep id age sex cp chol thalach num;
run;
proc print data =heart.subset_data(obs=10);
title "Subsetted data using age and cholestrol levels ";
run;title;
/**************************************** 7. CREATE A NEW VARIABLE ********************************************/

/*	a.	Examples include: create a categorical variable from a quantitative variable, 
		further collapse categories of an already categorical variable, create time period 
		variables from a set of dates, etc.	*/

/* Create a new variable grouping ages into categories */
data heart.new_var_data;
    set heart.heart_data_formatted;
    if age < 40 then age_group = 'Young';
    else if age <= 60 then age_group = 'Middle-aged';
    else age_group = 'Elderly';
run;
proc print data = heart.new_var_data(obs=10)noobs;
title " Dividing patients based on the age range ";
run;title;
/**************************************** 8. CATEGORICAL VARIABLES ********************************************/
 
/*	a.	Produce at least (2) frequency tables with a minimum of 2 variables each using the frequency procedure. 
		This means you must explore at least (2) variables within each frequency table. You are welcome to use more than two variables.	

	i.	Only include frequencies and row OR column percentages. Do not include all percentages which are the default
		since this is often difficult to understand. You may still include the total percentage if it makes sense for your data.
	ii.	Make sure to use a BY statement or a CLASS statement for at least (1) table.	
	iii.	Include a title for all tables included in your report.	
	iv.	Include a footer for at least (1) table you include in your report.	*/

/* Frequency table for sex and chest pain type */
proc freq data=heart.new_var_data;
    tables sex*cp / norow nocol nopercent;
    title "Frequency Table of Sex and Chest Pain Type";
run;title;
proc sort data=heart.new_var_data out=heart.new_var_data_sorted;
by age_group;
run;
/* Frequency table for exercise-induced angina by age group */
proc freq data=heart.new_var_data_sorted;
by age_group;
    tables age_group*exang / nocum nocol;
    title "Frequency Table of Age Group and Exercise-Induced Angina";
    footnote "Data reflects exercise response across age groups.";
run;footnote;

/**************************************** 9. QUANTITATIVE VARIABLES ********************************************/

/*	a.	Create at least (1) table for at least (2) variables using the PROC MEANS procedure.	*/

/*	i.	Make sure to include the sample size, mean, median, standard deviation, variance, minimum and maximum. 
	ii.	Make sure all quantitative variables are rounded to two decimals only. If it doesn’t make sense for your
		data to be rounded to two decimals, make a comment explaining this in your report and format
		to an appropriate number of decimals. 
		*Must use code to specify amount of decimals
	iii. Include a title for all tables included in your report.
	iv.	 Include a footer for at least (1) table you include in your report.	*/

/* Summary statistics for age and cholesterol */
proc means data=heart.new_var_data n mean median std var min max maxdec=2;
    var age trestbps thalch chol;
    title "Summary Statistics for Age and Cholesterol";
    footnote "All values are rounded to 2 decimals for clarity.";
run;footnote;

/**************************************** 10. Choose at least (3) from the list below to perform for your report ********************************************/

/*	a.	Generate column total
	b.	Merge or concatenate 2 datasets that you will then use for your report
	c.	Do Loop
	d.	Intck or Intnx function
	e.	Datdif or Yrdif function
	f.	Substr function
	g.	Catx or Trim function
	h.	Index or Find function
	i.	Upcase, Propcase or Lowcase function
	j.	Tranwrd function
	k.	Ceil or Floor function
	l.	Scan function
	m.	Macro variable
	n.	Weekday, Qtr, Month, Day, Year, Today, Date function
	o.	Scan function
	p.	Compbl function
	q.	Compress function
	r.	Any function we learned in class	*/



/* Add a column total for number of major vessels */
proc means data=heart.new_var_data sum maxdec=2;
    var ca;
    title "Column Total for Major Vessels";
run;

/* Create a dummy dataset and merge */
data heart.dummy_data;
    set heart.new_var_data(obs=10);
    keep id num;
    rename num=num_dummy;
run;

data heart.merged_data;
    merge heart.new_var_data heart.dummy_data;
    by id;
run;

/* Upcase the variable thal using upcase function */
data heart.upcase_example;
    set heart.new_var_data;
    thal_upper = upcase(thal);
run;

proc print data=heart.upcase_example(obs=10);
    var id thal_upper;
    title "Uppercase Transformation for Thalassemia Results";
run;title;

/* using floor function to round up */
data heart.ceil_floor_example;
    set heart.new_var_data;
    rounded_chol = floor(chol / 10) * 10; /* Rounding down to nearest 10 */
run;
proc print data=heart.ceil_floor_example(obs=10);
var id chol rounded_chol;
title "Rounded Cholestrol Values to near 10 ";
run;title;

/* Macro variable is created and then we have the inputs to test */
%let threshold_chol = 200;

data heart.macro_example;
    set heart.new_var_data;
    high_chol = (chol > &threshold_chol);
run;

/**************************************** 11. GRAPHS ***********************************************************/


/* Plot graph of Age vs. Maximum Heart Rate*/
proc sgplot data=heart.new_var_data;
    scatter x=age y=thalch / group=sex;
    title "Age vs. Maximum Heart Rate Achieved by Gender";
run;

/* Normal Distribution of Cholesterol bar graph */
proc sgplot data=heart.new_var_data;
    histogram chol;
    density chol / type=normal;
    title "Distribution of Serum Cholesterol Levels";
run;
