
// CALENDAR IN SWIFT 
// MARCH 22 2024 

func getNumberOfDaysInMonth(month: Int, year: Int) -> Int {
  let monthLengths = [31, 28 + (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) ? 1 : 0), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  return monthLengths[month - 1]
}

func getDayOfWeek(_ month: Int, _ year: Int) -> Int {
  let day = 1
  var month = month
  var year = year

  if month < 3 {
      month += 12
      year -= 1
  }

  let century = year / 100
  year %= 100

  let dayOfWeek = (day + ((13 * (month + 1)) / 5) + year + (year / 4) + (century / 4) + (5 * century)) % 7

  return (dayOfWeek + 5) % 7 + 1
}

func printCalendar(month: Int, year: Int) {
  let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  let dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

  let daysInMonth = getNumberOfDaysInMonth(month: month, year: year)
  let startDay = getDayOfWeek(month, year)

  print("\(monthNames[month - 1]) \(year)")

  for day in dayNames {
      print(day, terminator: "\t")
  }
  print()

  var dayCounter = 1
  var currentDay = 1

  for _ in 1...6 {
      for _ in 0...6 {
          if currentDay < startDay || dayCounter > daysInMonth {
              print("", terminator: "\t")
          } else {
              print("\(dayCounter)", terminator: "\t")
              dayCounter += 1
          }
          currentDay += 1
      }
      print()
  }
}

func inputDate() -> (Int, Int) {
  print("Enter month (1-12): ", terminator: "")
  let month = Int(readLine()!) ?? 1

  print("Enter year: ", terminator: "")
  let year = Int(readLine()!) ?? 2024

  return (month, year)
}

func main() {
  let (month, year) = inputDate()
  printCalendar(month: month, year: year)
}

main()
