-- Student's T-Test with Sample Data
-- Christopher Lee - 2021
--
-- This program is free software : you can redistribute itand /or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.If not, see < https://www.gnu.org/licenses/>.

-- Create variables for t value, degrees of freedom, standard deviation, averages and counts 

DECLARE @t DECIMAL(18,2) -- T value
DECLARE @degfree INT -- Degrees of freedom
DECLARE @stdev1 DECIMAL(18,2) -- Standard deviation for first sample 
DECLARE @avg1 DECIMAL(18,2) -- Average for first sample
DECLARE @cnt1 DECIMAL(18,2) -- Count for first sample
DECLARE @stdev2 DECIMAL(18,2) -- Standard deviation of second sample
DECLARE @avg2 DECIMAL(18,2) -- Average for second sample
DECLARE @cnt2 DECIMAL(18,2) -- Count for second sample

-- Create and populate table of critical values for t

IF OBJECT_ID('tempdb..#CritTValues') IS NOT NULL
    TRUNCATE TABLE #CritTValues
ELSE
    CREATE TABLE #CritTValues
    (
	Df INT NOT NULL,
	p05 DECIMAL(18,2) NOT NULL,
	p025 DECIMAL(18,2) NOT NULL,
	p01 DECIMAL(18,2) NOT NULL,
	p005 DECIMAL(18,2) NOT NULL
    )

INSERT INTO #CritTValues VALUES
(1,12.71,25.45,63.66,127.32), (2,4.30,6.20,9.92,14.09), (3,3.18,4.17,5.84,7.45), (4,2.78,3.50,4.60,5.60),
(5,2.57,3.16,4.03,4.77),(6,2.45,2.97,3.71,4.32),(7,2.36,2.84,3.50,4.03),(8,2.31,2.75,3.36,3.83),
(9,2.26,2.68,3.25,3.69),(10,2.23,2.63,3.17,3.58),(11,2.20,2.59,3.11,3.50),(12,2.18,2.56,3.05,3.43),
(13,2.16,2.53,3.01,3.37),(14,2.14,2.51,2.98,3.33),(15,2.13,2.49,2.95,3.29),(16,2.12,2.47,2.92,3.25),
(17,2.11,2.46,2.90,3.22),(18,2.10,2.44,2.88,3.20),(19,2.09,2.43,2.86,3.17),(20,2.09,2.42,2.84,3.15),
(21,2.08,2.41,2.83,3.14),(22,2.07,2.41,2.82,3.12),(23,2.07,2.40,2.81,3.10),(24,2.06,2.39,2.80,3.09),
(25,2.06,2.38,2.79,3.08),(26,2.06,2.38,2.78,3.07),(27,2.05,2.37,2.77,3.06),(28,2.05,2.37,2.76,3.05),
(29,2.04,2.36,2.76,3.04),(30,2.04,2.36,2.75,3.03),(40,2.02,2.33,2.70,2.97),(60,2.00,2.30,2.66,2.92),
(120,1.98,2.27,2.62,2.86),(10000,1.96,2.24,2.58,2.81)

-- Create temporary table for sample data and add values

IF OBJECT_ID('tempdb..#SampleData') IS NOT NULL
    TRUNCATE TABLE #SampleData
ELSE
    CREATE TABLE #SampleData
    (
	samp INT NOT NULL,
	vari INT NOT NULL
    )

INSERT INTO #SampleData VALUES
(1,27),(1,30),(1,15),(1,17),(1,21),(1,24),(1,26),(1,20),(1,21),(1,36),
(1,21),(1,31),(1,23),(1,32),(1,30),(1,20),(1,22),(1,32),(1,19),(1,25),
(2,2),(2,23),(2,32),(2,37),(2,14),(2,12),(2,15),(2,23),(2,31),(2,17),
(2,8),(2,13),(2,22),(2,14),(2,22),(2,12),(2,14),(2,22),(2,26),(2,16)

-- Calculate the variables which have already been declared in terms of standard deviation, average and counts.

SET @stdev1 = (SELECT StDev(s.vari) FROM #SampleData s WHERE s.samp = '1')
SET @avg1 = (SELECT Avg(Convert(DECIMAL(18, 2), vari)) FROM #SampleData s WHERE s.samp = '1')
SET @cnt1 = (SELECT Count(*) FROM #SampleData s WHERE s.samp = '1')
SET @stdev2 = (SELECT StDev(s.vari) FROM #SampleData s WHERE s.samp = '2')
SET @avg2 = (SELECT Avg(Convert(DECIMAL(18, 2), vari)) FROM #SampleData s WHERE s.samp = '2')
SET @cnt2 = (SELECT Count(*) FROM #SampleData s WHERE s.samp = '2')
SET @t = (@avg1 - @avg2) / Sqrt((Square(@stdev1) / @cnt1) + (Square(@stdev2) / @cnt2))
SET @degfree = @cnt1+@cnt2-2

-- Present t value which was set above and calculate significance

SELECT 'The t value was '+ Convert(VARCHAR(20),@t)+ ' with '+ Convert(VARCHAR(20),@degfree)+' degrees of freedom' as [T Value],
'The t value was'+
	CASE WHEN @t>#CritTValues.p005 THEN ' highly significant at the 0.005 level'
 	 WHEN @t>#CritTValues.p01 THEN ' significant at the 0.01 level'
 	WHEN @t>#CritTValues.p025 THEN ' significant at the 0.025 level'
 	 WHEN @t>#CritTValues.p05 THEN ' just significant at the 0.05 level'
	 ELSE  'n''t significant' end as [Significance]
 FROM #CritTValues 
WHERE df=(SELECT Min(df) FROM  #CritTValues ctv WHERE ctv.df>=@degfree)


