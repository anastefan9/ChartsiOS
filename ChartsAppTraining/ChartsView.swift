//
//  ChartsView.swift
//  ChartsAppTraining
//
//  Created by Ana Ștefan on 12.12.2024.
//

import SwiftUI
import Charts

struct AverageTemperature: Identifiable {
    var id = UUID()
    // 3.
    var month: String
    var temperature: Double
}

struct ChartsView: View {
    let viewMonths: [ViewsMonth] = [
        .init(date: Date.from(year: 2024, month: 1, day: 1), views: 200),
        .init(date: Date.from(year: 2024, month: 2, day: 1), views: 410),
        .init(date: Date.from(year: 2024, month: 3, day: 1), views: 2000),
        .init(date: Date.from(year: 2024, month: 4, day: 1), views: 478),
        .init(date: Date.from(year: 2024, month: 5, day: 1), views: 897),
        .init(date: Date.from(year: 2024, month: 6, day: 1), views: 1345),
        .init(date: Date.from(year: 2024, month: 7, day: 1), views: 777),
        .init(date: Date.from(year: 2024, month: 8, day: 1), views: 678),
        .init(date: Date.from(year: 2024, month: 9, day: 1), views: 900),
        .init(date: Date.from(year: 2024, month: 10, day: 1), views: 356),
        .init(date: Date.from(year: 2024, month: 11, day: 1), views: 878),
        .init(date: Date.from(year: 2024, month: 12, day: 1), views: 1789),
        
    ]
    
    var data: [AverageTemperature] = [
            AverageTemperature(month: "January", temperature: 10),
            AverageTemperature(month: "February", temperature: 12),
            AverageTemperature(month: "March", temperature: 14),
            AverageTemperature(month: "April", temperature: 16),
            AverageTemperature(month: "May", temperature: 18),
            AverageTemperature(month: "June", temperature: 21),
            AverageTemperature(month: "July", temperature: 24),
            AverageTemperature(month: "August", temperature: 25),
            AverageTemperature(month: "September", temperature: 24),
            AverageTemperature(month: "October", temperature: 21),
            AverageTemperature(month: "November", temperature: 15),
            AverageTemperature(month: "December", temperature: 11)
        ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Chart {
                    ForEach(viewMonths) { viewMonth in
                        BarMark(x: .value("Month", viewMonth.date, unit: .month), y: .value("Views", viewMonth.views))
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.blue.opacity(0.8),
                                        Color.purple.opacity(0.1)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .cornerRadius(10)
                    }
                }
            }
            .frame(height: 200)
            .padding(.bottom, 60)
            
            VStack {
                Chart {
                    ForEach(viewMonths) { viewMonth in
                        LineMark(x: .value("Month", viewMonth.date, unit: .month), y: .value("Views", viewMonth.views))
                    }
                    .interpolationMethod(.catmullRom)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [2]))
                    
                    ForEach(viewMonths) { viewMonth in
                        PointMark(x: .value("Month", viewMonth.date, unit: .month), y: .value("Views", viewMonth.views))
                    }
                }
                
                .chartXAxis {
                    AxisMarks(preset: .aligned, values: viewMonths.map { $0.date}) { _ in
                        AxisGridLine(centered: true).foregroundStyle(.blue)
                        AxisValueLabel()   // the month label
                        AxisTick(stroke: StrokeStyle(lineWidth: 2))
                                    .foregroundStyle(Color.gray)
                        
                    }
                }
            }
            .padding()
            .frame(height: 200)
            .padding(.bottom, 60)
            
            VStack {
                Chart {
                    ForEach(data) { viewMonth in
                        LineMark(x: .value("Month", viewMonth.month), y: .value("Total", viewMonth.temperature))
                    }
                    .interpolationMethod(.catmullRom)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [2]))
                    
                    ForEach(data) { viewMonth in
                        PointMark(x: .value("Month", viewMonth.month), y: .value("Total", viewMonth.temperature))
                    }
                }
                
                .chartXAxis {
                    AxisMarks(preset: .aligned, values: data.map { $0.month}) { value in
                        AxisGridLine(centered: true).foregroundStyle(.blue)
//                        AxisGridLine()
                        AxisValueLabel()   // the month label
                        AxisTick(stroke: StrokeStyle(lineWidth: 2))
                                    .foregroundStyle(Color.gray)
                        
                    }
                }
            }
            .padding()
            .frame(height: 200)
            .padding(.bottom, 60)
            
            VStack {
                Chart {
                    ForEach(viewMonths) { viewMonth in
                        LineMark(x: .value("Month", viewMonth.date, unit: .month), y: .value("Views", viewMonth.views))
                    }
                }
            }
            .frame(height: 200)
            .padding(.bottom, 60)
            
            VStack {
                Chart {
                    ForEach(viewMonths) { viewMonth in
                        LineMark(x: .value("Month", viewMonth.date, unit: .month), y: .value("Views", viewMonth.views))
                    }
                    .symbol {
                        Circle()
                            .fill(Color.blue.opacity(0.8))
                            .frame(width: 8)
                    }
                    
                    RuleMark(y: .value("Views", 1000.0))
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                        .annotation(alignment: .leading) {
                            Text("1000 views").bold()
                                .foregroundStyle(.secondary)
                        }
                    
                    ForEach(viewMonths) { viewMonth in
                        AreaMark(x: .value("Month", viewMonth.date, unit: .month), y: .value("Views", viewMonth.views))
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.blue.opacity(0.8),
                                        Color.purple.opacity(0.1)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    }
                }
            }
            .frame(height: 200)
            .padding(.bottom, 60)
            
            VStack {
                Chart() {
                    ForEach(data) { item in
                        SectorMark(angle: .value("Views", item.temperature))
    //                        .foregroundStyle(
    //                            LinearGradient(
    //                                gradient: Gradient(colors: [
    //                                    Color.blue.opacity(0.8),
    //                                    Color.purple.opacity(0.1)
    //                                ]),
    //                                startPoint: .top,
    //                                endPoint: .bottom
    //                            )
    //                        )
                            .foregroundStyle(by: .value("Views", item.temperature))
                    }
                }
            }
            .frame(height: 200)
            .padding(.bottom, 60)
            
            
        }
        .padding(.horizontal, 20)
        .padding(.top, 40)
    }
}

#Preview {
    ChartsView()
}

struct ViewsMonth: Identifiable {
    let id = UUID()
    let date: Date // x - horizontal
    let views: Int // y - vertical
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
