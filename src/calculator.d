import std.stdio;
import std.string;

class InvalidOperatorException : Exception {
	this(string msg, string file = __FILE__, size_t line = __LINE__) {
		super(msg, file, line);
	}
}

float calculate(char[] operator, float number1, float number2) {
	foreach (c; operator) {
		switch(c) {
				case '+':
					return number1 + number2;
				case '-':
					return number1 - number2;
				case '/':
					return number1 / number2;
				case '*':
					return number1 * number2;
				default:
					continue;
		}
	}
	throw new InvalidOperatorException("invalid operator used!");
}

void main() {
	char[] operator;
	float number1;
	float number2;
	write("enter a number: ");
	readf("%f", &number1);

	write("enter an operator: ");
	readf(" %s\n", &operator);

	write("enter another number: ");
  readf(" %f", &number2);

	float result;
	try {
		result = calculate(operator, number1, number2);
	} catch (InvalidOperatorException e) {
		writeln(e);
	}

	writeln(result);
}
