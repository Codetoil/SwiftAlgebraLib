//  SwiftAlgebraLib is a library adding abstract algebra to swift.
//
//  Copyright (C) 2024 Anthony Michalek
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.

//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import XCTest
@testable import SwiftAlgebraLib

final class SwiftAlgebraLibTests: XCTestCase {
    
    override func setUp() async throws {

    }
    
    func testGenericSetElementMembership() throws {
        XCTAssertFalse(GenericTestSet.instance.element ∈ EmptySet.instance, "element is in the empty set");
        XCTAssertTrue(GenericTestSet.instance.element ∈ GenericTestSet.instance, "element is not in the generic test set");
    }
}
