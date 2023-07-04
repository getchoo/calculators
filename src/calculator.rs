use std::error::Error;
use std::fmt;
use std::io;
use std::process;

#[derive(Debug)]
struct UnknownOperatorError;

impl Error for UnknownOperatorError {}

impl fmt::Display for UnknownOperatorError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "invalid operator!")
    }
}

fn get_input() -> String {
    let mut res = String::new();
    io::stdin()
        .read_line(&mut res)
        .expect("failed to get input!");

    return (*res).trim().to_string();
}

fn get_number() -> f32 {
    get_input()
        .parse::<f32>()
        .expect("failed to get your number (possible lack of rizz)")
}

fn calculate(operator: &String, number1: &f32, number2: &f32) -> Result<f32, UnknownOperatorError> {
    match operator.as_str() {
        "+" => Ok(number1 + number2),
        "-" => Ok(number1 - number2),
        "/" => Ok(number1 / number2),
        "*" => Ok(number1 * number2),
        _ => Err(UnknownOperatorError),
    }
}

fn main() {
    println!("enter a number: ");
    let number1 = get_number();
    println!("enter an operator: ");
    let operator = get_input();
    println!("enter another number: ");
    let number2 = get_number();

    let res = calculate(&operator, &number1, &number2);
    match res {
        Ok(i) => println!("{i}"),
        Err(e) => {
            eprintln!("{e}");
            process::exit(1);
        }
    }
}
