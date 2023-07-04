import java.util.Scanner;

class InvalidOperatorException extends Exception {
	public InvalidOperatorException(String errorMessage) {
		super(errorMessage);
	}
}

public class Calculator {
	private static float calculate(String operator, float number1, float number2) throws InvalidOperatorException {
		switch(operator) {
			case "+":
				return number1 + number2;
			case "-":
				return number1 - number2;
			case "/":
				return number1 / number2;
			case "*":
				return number1 * number2;
			default:
				throw new InvalidOperatorException("invalid operator used!");
		}
	}

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);

		float number1, number2, result;
		String operator;

		try {
			System.out.print("enter a number: " );
			number1 = scan.nextFloat();
			System.out.print("enter an operator: ");
			scan.nextLine();
			operator = scan.nextLine();
			System.out.print("enter another number: ");
			number2 = scan.nextFloat();
		} catch (Exception e) {
			System.out.println("couldn't get your input!");
			return;
		}

		try {
			result = calculate(operator, number1, number2);
		} catch (InvalidOperatorException e) {
			System.out.println(e.getMessage());
			return;
		}

		System.out.println(result);
	}
}
