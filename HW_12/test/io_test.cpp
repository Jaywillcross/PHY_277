#include<iostream>
#include<fstream>

int main()
{
	std::ifstream infile("file.txt");

	int a, b;
	while(infile >> a >> b)
	{
		std::cout << a << " " << b << std::endl;
	}


	infile.close();

	return 0;
}
