<img src="https://render.githubusercontent.com/render/math?math=e^{i \pi} = -1">

<img src="https://render.githubusercontent.com/render/math?math=\rho = \frac{\text{cov}(X,Y)}{\sigma_x \sigma_y}">

<img src="https://render.githubusercontent.com/render/math?math=r = \frac{{}\sum_{i=1}^{n} (x_i - \overline{x})(y_i - \overline{y})}{\sqrt{\sum_{i=1}^{n} (x_i - \overline{x})^2(y_i - \overline{y})^2}}">


# Statistical Tests

Statistical tests implemented in T-SQL with sample data.

In the implementations provided, the statistical tests are provided as temporary stored procedures.  This is intended to allow users to try the tests without requiring write permissions on the database that they are using.

Sample data is also included with each test which allows a straightforward, practical demonstration of how the scripts work in practice.

### Prerequisites

SQL Server

SQL Server Management Studio

### Installing

Both scripts have been written using temporary tables and temporary stored procedures and so it is not required to install anything in order for the scripts to run successfully.

## Authors

* **Christopher Lee** (https://github.com/chrislee1018/)


## License

This project is licensed under the GNU General Public License License 3.0 - see the [LICENSE](LICENSE) file for details

# Pearson Correlation Coefficient in T-SQL

An implementation of the Pearson Correlation Coefficient in T-SQL with sample data to demonstrate functionality.

## Background

In statistics, the Pearson correlation coefficient, also referred to as Pearson's r is a measure of linear correlation between two sets of data.

It is the covariance of two variables, divided by the product of their standard deviations. This creates a normalised measurement of covariance with a result between −1 and 1. 

### Prerequisites

* SQL Server

* SQL Server Management Studio

The SQL used does not involve any functions or features speccific to recent versions of Microsoft SQL Server and so should run without issue on any implementation of Microsoft SQL Server which is available.

### Installing

Both scripts have been written using temporary tables and temporary stored procedures and so it is not required to install anything in order for the scripts to run successfully.

## Authors

* **Christopher Lee** (https://github.com/chrislee1018/)


## License

This project is licensed under the GNU General Public License License 3.0 - see the [LICENSE](LICENSE) file for details

