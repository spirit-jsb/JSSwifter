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
    
    /// 使用 MKAnnotationView 的子类注册 MKAnnotationView
    ///
    /// - Parameter viewClass: 在 map 视图上使用的 annotation 视图的类，该类必须为 MKAnnotationView 的子类。
    @available(iOS 11.0, *)
    func register<T: MKAnnotationView>(viewClass: T.Type) {
        let reusable = ReusableIdentifier<T>()
        self.register(viewClass.self, forAnnotationViewWithReuseIdentifier: reusable.identifier)
    }
    
    /// 移除可重用的 MKAnnotationView
    ///
    /// - Returns: 返回具有指定 identifier 的 annotation 视图，如果重用队列中不存在此类对象则抛出异常
    func dequeueReusableAnnotationView<T: MKAnnotationView>() -> T {
        let reusable = ReusableIdentifier<T>()
        guard let annotationView = self.dequeueReusableAnnotationView(withIdentifier: reusable.identifier) as? T else {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return annotationView
    }
    
    /// 移除可重用的 MKAnnotationView
    ///
    /// - Parameter annotation: 一个显式的 MKAnnotation 对象，用于分配给移除的 MKAnnotationView 对象
    /// - Returns: 返回具有指定 identifier 的 annotation 视图，如果重用队列中不存在此类对象则抛出异常
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
