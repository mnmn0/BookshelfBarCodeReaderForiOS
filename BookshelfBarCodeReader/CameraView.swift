//
//  CameraView.swift
//  BookshelfBarCodeReader
//
//  Created by Shinji Minamino on 2022/11/13.
//

import SwiftUI

struct CameraView: View {
    @ObservedObject private var avFoundationVM = AVFoundationVM()
    var body: some View {
            VStack {
                if avFoundationVM.image == nil {
                    Spacer()

                    ZStack(alignment: .bottom) {
                        CALayerView(caLayer: avFoundationVM.previewLayer)

                        Button(action: {
                            self.avFoundationVM.takePhoto()
                        }) {
                            Image(systemName: "camera.circle.fill")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        }
                        .padding(.bottom, 100.0)
                    }.onAppear {
                        self.avFoundationVM.startSession()
                    }.onDisappear {
                        self.avFoundationVM.endSession()
                    }

                    Spacer()
                } else {
                    ZStack(alignment: .topLeading) {
                        VStack {
                            Spacer()

                            Image(uiImage: avFoundationVM.image!)
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fit)

                            Spacer()
                        }
                        Button(action: {
                            self.avFoundationVM.image = nil
                        }) {
                                Image(systemName: "xmark.circle.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color.gray)
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                    }
                }
            }
        }
    }

    struct CameraView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
            }
        }
    }
