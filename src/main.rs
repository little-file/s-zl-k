use std::io;

fn main() {
    let mut kelime = String::new();

    io::stdin()
        .read_line(&mut kelime)
        .expect("Failed to read line");
    println!("You kelime: {kelime}");
    let url = format!("https://sozluk.gov.tr/?kelime={}", kelime);
    println!("{url}");

}
