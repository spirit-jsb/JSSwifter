//
//  MKMapView+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import MapKit

public extension MKMapView {
    
    // MARK:
    private struct ReusableIdentifier <T: UIView> {
        
        // MARK:
        let identifier: String = String(describing: T.self)
    }
    
    // MARK:
    @available(iOS 11.0, *)
    func register<T: MKAnnotationView>(viewClass: T.Type) {
        let reusable = ReusableIdentifier<T>()
        self.register(viewClass.self, forAnnotationViewWithReuseIdentifier: reusable.identifier)
    }
    
    func dequeueReusableAnnotationView<T: MKAnnotationView>() -> T {
        let reusable = ReusableIdentifier<T>()
        guard let annotationView = self.dequeueReusableAnnotationView(withIdentifier: reusable.identifier) as? T else {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return annotationView
    }
    
    @available(iOS 11.0, *)
    func dequeueReusableAnnotationView<T: MKAnnotationView>(for annotation: MKAnnotation) -> T {
        let reusable = ReusableIdentifier<T>()
        guard let annotationView = self.dequeueReusableAnnotationView(withIdentifier: reusable.identifier, for: annotation) as? T else
        {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return annotationView
    }
}
