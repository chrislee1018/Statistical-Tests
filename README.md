# Pearson Correlation Coefficient in T-SQL

An implementation of the Pearson Correlation Coefficient in T-SQL with sample data to demonstrate functionality.

## Background

In statistics, the Pearson correlation coefficient, also referred to as Pearson's r is a measure of linear correlation between two sets of data.

It is the covariance of two variables, divided by the product of their standard deviations. This creates a normalised measurement of covariance with a result between −1 and 1. 

The Pearson correlation coefficient is probably the most widely used measure for linear relationships between two normal distributed variables and thus often just called "correlation coefficient". Usually, the Pearson coefficient is obtained via a Least-Squares fit and a value of 1 represents a perfect positive relation-ship, -1 a perfect negative relationship, and 0 indicates the absence of a relationship between variables.

<img src="https://render.githubusercontent.com/render/math?math=\rho = \frac{\text{cov}(X,Y)}{\sigma_x \sigma_y}">

This is then estimated through the following formula: 

<img src="https://render.githubusercontent.com/render/math?math=r = \frac{{}\sum_{i=1}^{n} (x_i - \overline{x})(y_i - \overline{y})}{\sqrt{\sum_{i=1}^{n} (x_i - \overline{x})^2(y_i - \overline{y})^2}}">

## Authors

* **Christopher Lee** (https://github.com/chrislee1018/)

## License

This project is licensed under the GNU General Public License License 3.0 - see the [LICENSE](LICENSE) file for details.
