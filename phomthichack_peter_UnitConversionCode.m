miles = 5;
millimeters = 3250000;
pounds = 25;
cubicYards = 3;
u = symunit;

miles_to_inches = miles * 63360;
millimeter_to_megameter = millimeters / 10^9;
pounds_to_gram = pounds * 453.6;
cubicYards_to_cubicCentimeters = cubicYards * 764600;

% Display the conversion with manual calculation
disp(miles_to_inches);
disp(millimeter_to_megameter);
disp(pounds_to_gram);
disp(cubicYards_to_cubicCentimeters);

% Display the conversion using unitConvert
disp(unitConvert(miles * u.mile, u.inch));
disp(unitConvert(millimeters * u.millimeter, u.Mm));
disp(unitConvert(pounds * u.lbm, u.g));
disp(unitConvert(cubicYards * u.yd^3, u.cm^3));

