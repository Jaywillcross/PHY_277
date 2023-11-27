// Purpose:	The purpose of this code is to calculate the relativistic and
// 			non-relativistic kinetic energy of a particle with a mass m
// 			and a velocity v

#include<iostream>
#include<cmath>

int main()
{
	const double C {3.0e8};

	double mass;
	double velocity;
	double relativistic_factor;
	double relativistic_kinetic_energy;
	double nonrelativistic_kinetic_energy;

	std::cout << "The objective of this program is the calculate the kinetic "
		"energy of a particle given a mass m and a velocity v?" << std::endl;
	std::cout << "What is the mass in kg?" << std::endl;
	std::cin >> mass;
	std::cout << "What is the velocity in m/s?" << std::endl;
	std::cin >> velocity;

	nonrelativistic_kinetic_energy = 0.5 * mass * pow(velocity,2);
	std::cout << C  << std::endl;
	relativistic_factor = 1.0 / std::sqrt((1.0-velocity/C) * (1.0+velocity/C));
	std::cout << (1.0-velocity/C) * (1.0+velocity/C) << std::endl;
	relativistic_kinetic_energy = mass * pow(C,2) * (relativistic_factor - 1);

	std::cout << "Relativistic Kinetic Energy in J" << std::endl;
	std::cout << relativistic_kinetic_energy << std::endl;
	std::cout << "Non-relativistic Kinetic Energy in J" << std::endl;
	std::cout << nonrelativistic_kinetic_energy << std::endl;

	return 0;
}
