

// Introduction to Enum

enum Weekday: String {
    case Monday = "Work today"
    case Wednesday = "Do not work"
    case Friday = "Almost weekend"
}

Weekday.Monday.rawValue
Weekday.Wednesday.rawValue

// Ex) Ticket Selling

//Child - $5
//Adult - $10

enum TicketSale {
    case child
    case adult
}

var myTicket = TicketSale.adult

switch myTicket {
case .child:
    print("Pay $5")
case .adult:
    print("Pay $10")

}