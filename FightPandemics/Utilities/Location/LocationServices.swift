//
//  LocationServices.swift
//  FightPandemics
//
//  Created by Harlan Kellaway on 5/20/20.
//
//  Copyright (c) 2020 FightPandemics
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import CoreLocation
import Foundation

final class LocationServices: NSObject {
    // MARK: - Properties

    static var shared = LocationServices()

    /// Current Location permission status.
    /// - Remark: Apple discourages relying on `CLLocationManager.authorizationStatus()` directly; instead `locationManager(didChangeAuthorization:)`
    ///  is listened for and this value is kept up-to-date.
    private(set) var permissionStatus: CLAuthorizationStatus = CLLocationManager.authorizationStatus() {
        didSet {
            notifyObservers()
        }
    }

    var isPermissionAccepted: Bool {
        return permissionStatus == .authorizedWhenInUse || permissionStatus == .authorizedAlways
    }

    var isPermissionDenied: Bool {
        return permissionStatus == .denied || permissionStatus == .restricted
    }

    private let locationManger: CLLocationManager
    private var observers = [ObjectIdentifier: Observation]()

    // MARK: - Init/Deinit

    init(locationManger: CLLocationManager = CLLocationManager()) {
        self.locationManger = locationManger
        super.init()
        self.locationManger.delegate = self
    }

    // MARK: - Instance methods

    func requestPermission() {
        locationManger.requestWhenInUseAuthorization()
    }
}

// MARK: - Observation

extension LocationServices {
    struct Observation {
        weak var value: LocationServicesObserver?
    }

    func addObserver(_ observer: LocationServicesObserver) {
        let id = ObjectIdentifier(observer)
        observers[id] = Observation(value: observer)
    }

    func removeObserver(_ observer: LocationServicesObserver) {
        let id = ObjectIdentifier(observer)
        observers.removeValue(forKey: id)
    }

    private func notifyObservers() {
        for (id, observer) in observers {
            guard let observer = observer.value else {
                observers.removeValue(forKey: id)
                continue
            }
            observer.locationServicesPermissionsDidChange()
        }
    }
}

// MARK: - Protocol conformance

// MARK: CLLocationManagerDelegate

extension LocationServices: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        permissionStatus = status
    }
}
