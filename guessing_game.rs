use rand::Rng;
use std::cmp::Ordering;
use std::io;

fn main() {

// Block of code for the input of name then assigning name to variable x for later use.
//Using std::io library for string, &mut, read_line, unwrap and string snatch functions.

   {
    let mut name = String::new();
    println!("
Please input your name:");
    let _b1 = std::io::stdin().read_line(&mut name).unwrap();
    println!("
Hi {}",name.clone() + "Thanks for playing today.");
    println!("The game range is -100 upto 100, Good luck.");
    
    let x = name;

//Algorithm for random genrated number between -100 - + 100. Assinged to a variable secret_number.
//Calling the rand function after initiating library above.
        
    let secret_number = rand::thread_rng().gen_range(-101..101);

//Block of code for input while playing. Had to put a loop break after answer like a return0 in C and use assigned variable to get correct output.
//Also had to use module i32 for + and - recognition.
    
    loop {
        println!("
Please input your guess.");
        let mut guess = String::new();
        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");
        let guess: i32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };        

        println!("You guessed: {}", guess);

//Using the function ordering after calling library above for my multiple choices,
//Depending on loop function choice after guess accessment.  

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small, guess again!"),
            Ordering::Greater => println!("Too big, have another go!"),
            Ordering::Equal => {
                  
                  println!("
Correct you win, well played: {x}");
                  break;
            }
         } 
     }
      println!("
Built in rust by Blú Corbel."); //All lines to print that are put on different lines are for ease of viewing in output.
}

}