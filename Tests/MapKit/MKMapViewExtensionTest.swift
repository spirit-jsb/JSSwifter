//
//  MKMapViewExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

#if canImport(MapKit)
import MapKit

class MKMapViewExtensionTest: XCTestCase {
    
    let mapView = MKMapView(frame: .zero)

    override func setUp() {
        super.setUp()
        
        self.mapView.delegate = self
    }
    
    func test_register_dequeue() {
        if #available(iOS 11.0, *) {
            self.mapView.register(viewClass: TestAnnotationView.self)
            let annotationView = self.mapView.dequeueReusableAnnotationView(for: TestAnnotation()) as TestAnnotationView
            XCTAssertNotNil(annotationView)
        }
        else {
            let annotationView = self.mapView.dequeueReusableAnnotationView() as TestAnnotationView
            XCTAssertNotNil(annotationView)
        }
    }
}

extension MKMapViewExtensionTest: MKMapViewDelegate {
    
}

private class TestAnnotationView: MKAnnotationView {  }
private class TestAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: -15.822877, longitude: -47.941839)
    }
}

#endif
