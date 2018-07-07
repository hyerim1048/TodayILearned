pandas = check nan / null /none

https://stackoverflow.com/questions/29530232/python-pandas-check-if-any-value-is-nan-in-dataframe

	* 
Option 1: df.isnull().any().any() - This returns a boolean value

		* 
df.isnull().any()-  the columns that have NaN values:




	* 
Option 2: df.isnull().sum().sum() - This returns an integer of the total number of NaNvalues:






.any(), .all()
.any() :Series의 하나라도 0 (False) 이 아니면(True) True
.all() : Series 중 하나만 0(False) 면 False이다.
False == 0 (True)
True == 1 (False)
