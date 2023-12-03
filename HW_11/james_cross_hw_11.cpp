// Program:	Find the roots of a quadratic equation
// Author:	James Cross
// Date:	December 2, 2023

#include<iostream>
#include<cmath>

int main()
{
	// Brace-initialize the coefficients
	double a{}; 
	double b{};
	double c{};

	// and the parts of the roots
	double first_part{};
	double second_part{};

	// Answers are in the form of 'first_part +/- second_part', unless
	// there is only one root in which case its just 'first_part'
	
	// Turn on fixed point point notation for std::cout 	
	// Always show the decimal point
	// Set the precision of std::cout to 15 digits for the doubles
	std::cout.setf(std::ios::fixed);
	std::cout.setf(std::ios::showpoint);
	std::cout.precision(15);

	std::cout << "This program finds the roots of the quadratic equation"
		"ax^2 + bx + c = 0" << std::endl;
	std::cout << "What is a?" << std::endl;
	std::cin >> a;
	std::cout << "What is b?" << std::endl;
	std::cin >> b;
	std::cout << "What is c?" << std::endl;
	std::cin >> c;

	// Decision tree if any of the coefficients are 0
	if (a == 0.0)
	{
		if (b == 0.0)
		{
			if (c == 0.0) 
			{
				std::cout << "The equation is trivially true for all x" 
					<< std::endl;
				return 1;
			}
			else
			{
				std::cout << "Please enter a valid equation.\n"
					<< "You entered" << c << "=0" << std::endl;
				return 1;
			}
		}
		else
		{
			first_part = -b/c;
			second_part = 0.0;
			std::cout << "The only root is " << first_part << std::endl;
		}
	}
	else
	{
		first_part = b/(2.0*a);
		// Check the discriminant for the complex case
		if (pow(b,2) < 4.0*a*c)
		{
			second_part = std::sqrt(c/a - pow(first_part,2));
			std::cout << "The first root is  " 
				<< first_part << "+i" << second_part
				<< std::endl;
			std::cout << "The second root is " 
				<< first_part << "-i" << second_part
				<< std::endl;
	   	}
		else
		{
			second_part = std::sqrt(pow(first_part,2) - c/a);
			std::cout << "The first root is  " 
				<< first_part+second_part
				<< std::endl;
			std::cout << "The second root is " 
				<< first_part-second_part
				<< std::endl;
		}
	}
				
	// Assure that the buffer is emptied
	std::cout << std::endl;
	return 0;
}
