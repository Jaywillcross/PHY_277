// Program:	Perform a linear regression on data read in from a file
// Author:	James Cross
// Date:	December 8, 2023

#include<iostream>
#include<fstream>
#include<string>
#include<cmath>

int main()
{

	// Initialization ---
	// Initialize variables
	std::ifstream input_file;
	std::ofstream output_file;
	std::string input_file_name{};
	std::string output_file_name{};

	double x{};
	double y{};
	double y_fitted{};
	bool is_good;


	double *x_array{nullptr};
	double *y_array{nullptr};
	double *y_fitted_array{nullptr};
	int array_size{0};
	double N{0.0};

	double slope{};
	double intercept{};
	double chi_squared{};
	double summed_product{};
	double summed_x{};
	double summed_y{};
	double summed_x_squared{};


	std::cout << "What is the name of the data file?" << std::endl;
	//std::cin >> input_file_name;
	input_file_name = "linear_test.dat";

	input_file.open(input_file_name);

	// Try reading in the data. If the read succeeds, increment the size of 
	// the array. If the read fails (like at the end of the file), 
	// input_file.fail() becomes TRUE and the loop breaks.
	while(input_file.good())
	{
		input_file >> x >> y;
		if(input_file.fail()) 
		{
			break;
		}
		array_size++;
	}


	// Clear file stream errors and go back to the beginning of the file
	input_file.clear();
	input_file.seekg(0,std::ios::beg);

	// Allocate space for array
	if(x_array == nullptr)
	{
		x_array = new double[array_size];
	}

	if(y_array == nullptr)
	{
		y_array = new double[array_size];
	}


	// Read in data and then close the file and clear the error flags
	for (int i=0; i < array_size; i++)
	{
		input_file >> x_array[i] >> y_array[i];
		std::cout << x_array[i] << " " << y_array[i] << std::endl;
	}

	input_file.close();
	input_file.clear();

	// Do math
	for (int i=0; i < array_size; i++)
	{
		summed_product += x_array[i] * y_array[i];
		summed_x += x_array[i];
		summed_y += y_array[i];
		summed_x_squared += pow(x_array[i],2);

	}

	std::cout << summed_product << " " << summed_x << " " << summed_y 
		<< " " << summed_x_squared << std::endl;

	N = static_cast<double>(array_size);
	slope = (N * summed_product - summed_x * summed_y) / 
			(N * summed_x_squared - pow(summed_x,2));
	intercept = (summed_y - slope * summed_x) / N;

	for (int i=0; i < array_size; i++)
	{
		chi_squared += pow(y_array[i]-(slope*x_array[i]+intercept),2);
	}
	
	std::cout << "Slope: " << slope << std::endl;
	std::cout << "Intercept: " << intercept << std::endl;
	std::cout << "Chi-Squared: " << chi_squared << std::endl;
	
	// Sort the data
	
	double x_placeholder{};
	double y_placeholder{};
	int min_loc{};
	for (int i=0; i < array_size; i++)
	{
		std::cout << "i: " << i << std::endl;
		min_loc = i;
		for (int j=i+1; j < array_size; j++)
		{
			std::cout << "j: " << j << std::endl;
			if (x_array[j] < x_array[min_loc])
			{
				min_loc = j;
			}
		}
		x_placeholder = x_array[i];
		x_array[i] = x_array[min_loc];
		x_array[min_loc] = x_placeholder;
		
		y_placeholder = y_array[i];
		y_array[i] = y_array[min_loc];
		y_array[min_loc] = y_placeholder;
	}
	
	// Ask the user for the output file name
	
	std::cout << "What is the name of the file that you want to write to?"
		<< std::endl;
	output_file_name = "sorted.dat";
	output_file.open(output_file_name);

	//std::cin >> output_file_name;
	//
	for (int i=0; i < array_size; i++)
	{
		std::cout << x_array[i] << " " << y_array[i] << std::endl;
		output_file << x_array[i] << " " << y_array[i] << std::endl;
	}

	output_file.clear();
	output_file.close();

	// Output ---
	// Write the sorted data AND the fitted data points to another file
	// Output the slope, intercept and chi-squared for the fit

	// Delete and nullify array pointers 
	delete [] x_array;
	x_array = nullptr;
	delete [] y_array;
	y_array = nullptr;

	return 0;
}
