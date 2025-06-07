import SwiftUI

struct AvailabilityCalendar: View {
    let markedDates: Set<Date>
    @State private var thisWeekDates: [Date] = []
    @State private var nextWeekDates: [Date] = []
    @State private var selectedDate: Date? = nil
    
    
    private let weekdayHeaders = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]

    private let dayNumberFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "d"
        return f
    }()
    private let fullDateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .full
        return f
    }()

    var body: some View {
        VStack(spacing: 8) {
                        
            HStack(spacing: 8) {
                ForEach(weekdayHeaders, id: \.self) { label in
                    Text(label)
                        .font(.caption.bold())
                        .foregroundColor(.secondary)
                        .frame(width: 48, height: 20)
                        .multilineTextAlignment(.center)
                }
            }


            HStack(spacing: 8) {
                ForEach(thisWeekDates, id: \.self) { date in
                    DayBlockView(
                        date: date,
                        isMarked: markedDates.contains(date.strippedTime()),
                        dayNumberFormatter: dayNumberFormatter
                    ) {
                        if markedDates.contains(date.strippedTime()) {
                            selectedDate = date
                        }
                    }
                }
            }

            HStack(spacing: 8) {
                ForEach(nextWeekDates, id: \.self) { date in
                    DayBlockView(
                        date: date,
                        isMarked: markedDates.contains(date.strippedTime()),
                        dayNumberFormatter: dayNumberFormatter
                    ) {
                        if markedDates.contains(date.strippedTime()) {
                            selectedDate = date
                        }
                    }
                }
            }
            
        }
        .padding(.horizontal)
        .onAppear {
            computeTwoWeeks()
        }

        .sheet(
            isPresented: Binding<Bool>(
                get: { selectedDate != nil },
                set: { newValue in
                    if newValue == false {
                        selectedDate = nil
                    }
                }
            )
        ) {
            if let date = selectedDate {
                ScheduleDetailSheet(date: date, formatter: fullDateFormatter)
            } else {
                Text("No date selected")
            }
        }
    }

    private func computeTwoWeeks() {
        let calendar = Calendar.current
        let today = Date()
        let strippedToday = today.strippedTime(using: calendar)
        let weekdayComponent = calendar.component(.weekday, from: strippedToday)
        let daysToSubtractForMonday = (weekdayComponent + 5) % 7

        guard let startOfThisWeek = calendar.date(
            byAdding: .day,
            value: -daysToSubtractForMonday,
            to: strippedToday
        ) else {
            return
        }

        var thisWeek: [Date] = []
        for offset in 0..<7 {
            if let nextDate = calendar.date(byAdding: .day, value: offset, to: startOfThisWeek) {
                thisWeek.append(nextDate)
            }
        }
        thisWeekDates = thisWeek
        nextWeekDates = thisWeek.map { calendar.date(byAdding: .day, value: 7, to: $0)! }
    }
}

fileprivate struct DayBlockView: View {
    let date: Date
    let isMarked: Bool
    let dayNumberFormatter: DateFormatter
    let onTap: () -> Void
    
    private var isToday: Bool {
        Calendar.current.isDateInToday(date)
    }
    
    var body: some View {
        Button(action: onTap) {
            Text(dayNumberFormatter.string(from: date))
                .font(.headline)
                .frame(width: 48, height: 48)
                .background(
                    isMarked
                        ? Color.accentColor
                        : Color(white: 0.9)
                )
                .foregroundColor(isMarked ? .white : .primary)
                .cornerRadius(8)
        }
        .disabled(!isMarked)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.accentColor, lineWidth: isToday ? 3 : 0)
        )
    }
}

fileprivate struct ScheduleDetailSheet: View {
    let date: Date
    let formatter: DateFormatter

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Schedule for")
                    .font(.title3.weight(.semibold))
                    .padding(.top, 20)

                Text(formatter.string(from: date))
                    .font(.headline)
                    .foregroundColor(.secondary)

                Divider().padding(.vertical, 8)

                LecturerScheduledCard(
                    title: "Web API Lecture - Session 2",
                    subtitle: "For batch BSC 24.1P",
                    timeRange: "12.00 AM – 3.00 PM",
                    location: "Lecture Hall 02"
                )

                LecturerScheduledCard(
                    title: "Web API Lecture - Session 2",
                    subtitle: "For batch BSC 24.1P",
                    timeRange: "12.00 AM – 3.00 PM",
                    location: "Lecture Hall 02"
                )


                Spacer()
            }
            .padding()
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }
}

#Preview {
          
        let marked: Set<Date> = getSampleMarkedDates()
        AvailabilityCalendar(markedDates: marked)
}

