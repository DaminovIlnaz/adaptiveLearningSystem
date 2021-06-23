package ru.itis.kpfu.demo.genetic_algoritm.GeneticFramework;

public interface FitnessFunction {
	int getArity();
	long run(long[] genom);
}
