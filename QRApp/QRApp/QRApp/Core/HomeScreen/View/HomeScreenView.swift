//
//  ContentView.swift
//  DEUZEM
//
//  Created by admin on 17.11.2023.
//

/*
import SwiftUI
import CoreData
 
struct HomeScreenView: View {
    
    
    let navigationBarTitle: String = "Home Screen"
    @State var lessons : [String] = ["Qr Scanner","Find iBeacon"]
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                HomeScreenStack(items: lessons){ lesson in
                    ZStack{
                        RoundedRectangle(cornerRadius: 24.0)
                            .foregroundStyle(.blue)
                            .overlay {
                                Text("\(lesson)")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                                    
                            }
                        RoundedRectangle(cornerRadius: 24.0)
                            .stroke(.blue, style: .init(lineWidth: 8))
                            .background(.clear)
                    }
                }

            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle(
                navigationBarTitle
            )
            .navigationBarTitleDisplayMode(.large)
            .background(Color.black.gradient)
        }
        .preferredColorScheme(.dark)
    }
}

struct HomeScreenStack<T: Hashable, Content: View>: View  {
    
    // MARK: - Properties
    
    let items: [T]
    
    let content: (T) -> Content
    
    // MARK: - Life circle

    var body: some View {
            LazyVStack(spacing: 5, content: itemsTpl)
            .padding(24)
            .scrollTargetLayout()
    }
    
    // MARK: - Template
    
    private func itemsTpl() -> some View {
        ForEach(items, id : \.hashValue) { item in
            
            NavigationLink {
                if(item == items[0]){
                    QrScannerView()
                }
                else if(item == items[1]){
                    ContentView()
                }
            } label: {
                content(item)
                .containerRelativeFrame(
                    .vertical,
                    count: 10,
                    span: 7,
                    spacing: 24
                )
                .scrollTransition { content, phase in
                    content
                       
                        .blur(radius: phase.isIdentity ? 0 : 5)
                        .scaleEffect(phase.isIdentity ? 1 : 0.8)
                        .opacity(phase.isIdentity ? 1 : 0)
                }
            }
        }
    }
}

#Preview {
    HomeScreenView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
*/
